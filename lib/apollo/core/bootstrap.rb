# frozen_string_literal: true

require 'sinatra/base'
require 'i18n'
require 'mongoid'

require 'apollo/controllers/admin_user_controller'
require 'apollo/controllers/admin_settings_controller'
require 'apollo/controllers/admin_post_controller'
require 'apollo/controllers/admin_page_controller'
require 'apollo/controllers/admin_login_controller'
require 'apollo/controllers/admin_dashboard_controller'
require 'apollo/controllers/admin_controller'
require 'apollo/controllers/admin_attachment_controller'
require 'apollo/controllers/admin_addon_controller'

module Apollo
  module Core
    class Bootstrap

      def initialize
        @addon_bootstrapper = Apollo::Core::AddonBootstrapper.new
        @job_manager = Apollo::Core::JobManager.instance
        @addon_manager = Apollo::Core::AddonManager.instance
      end

      def bootstrap

        @addon_bootstrapper.list_addons.each do |addon|
          @addon_bootstrapper.install_addon addon
          @addon_bootstrapper.load_addon addon
        end

        I18n.load_path << Dir[File.expand_path("../../config/locales/", __FILE__) + "*.yml"]

        Mongoid.load!(File.expand_path("../../../../config/mongoid.yml", __FILE__), ENV["APP_ENV"])

        Sinatra::Application.use Apollo::Controllers::AdminAddonController
        Sinatra::Application.use Apollo::Controllers::AdminPageController
        Sinatra::Application.use Apollo::Controllers::AdminPostController
        Sinatra::Application.use Apollo::Controllers::AdminUserController
        Sinatra::Application.use Apollo::Controllers::AdminSettingsController
        Sinatra::Application.use Apollo::Controllers::AdminAttachmentController
        Sinatra::Application.use Apollo::Controllers::AdminDashboardController
        Sinatra::Application.use Apollo::Controllers::AdminLoginController

        # Storing a reference of the descendants for avoiding gc
        controllers = @addon_manager.descendants.map {|addon| addon.new }
        controllers.each {|addon| addon.controllers.each {|controller| Sinatra::Application.use controller } }

        @job_manager.load_all
      end

    end
  end
end
