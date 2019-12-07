# frozen_string_literal: true

module Apollo
  module Controllers
    class PluginController < Sinatra::Base

      attr_accessor :plugin_name

      register Sinatra::Flash

      def find_template(views, name, engine, &block)
        Array(views).each do |v|
          super(v, name, engine, &block)
        end
      end

      configure do
        set(:views, proc {
          [
            File.join(root, '..', 'assets'),
            File.join(root, '..', 'plugins', @plugin_name, 'assets')
          ]
        })

        set(:public_folder, proc {
          [
            File.join(root, '..', 'views'),
            File.join(root, '..', 'plugins', @plugin_name, 'views')
          ]
        })

        set(:show_exceptions, proc { ENV['APP_ENV'] == 'development' || ENV['APP_ENV'].nil? })
        set(:raise_errors, proc { ENV['APP_ENV'] == 'development' || ENV['APP_ENV'].nil? })
        enable :sessions
      end

      protected

      def logged_in?
        !session[:user_id].nil?
      end

      def current_user
        User[session[:user_id]]
      end

    end
  end
end
