# frozen_string_literal: true

require 'apollo/controllers/admin_controller'
require 'apollo/core/addon_manager'

module Apollo
  module Controllers
    class AdminAddonController < Apollo::Controllers::AdminController

      get '/admin/addons' do
        @themes = Apollo::Core::AddonManager.instance.descendants
        erb :'addons/index.html', layout: :'admin_layout.html'
      end

      get '/admin/addons/:addon_name' do |addon_name|
        @theme = Apollo::Core::AddonManager.instance.descendants.detect {|theme| theme.name == addon_name }
        erb :'addons/show.html', layout: :'admin_layout.html'
      end

    end
  end
end
