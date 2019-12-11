# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminController < ::Sinatra::Base
      register ::Sinatra::Flash
      include Apollo::Helpers::AdminNavigation

      configure do
        set(:views, proc { File.join(root, '..', 'views') })
        set(:public_folder, proc { File.join(root, '..', 'views', 'assets') })
        set(:show_exceptions, proc { ENV['APP_ENV'] == 'development' || ENV['APP_ENV'].nil? })
        set(:raise_errors, proc { ENV['APP_ENV'] == 'development' || ENV['APP_ENV'].nil? })
        enable :sessions
      end

      protected

      def logged_in?
        !session[:user_id].nil?
      end

      def current_user
        @current_user ||= Apollo::User[session[:user_id]]
      end

      # Todo we can just call error FileNotFoundError do so we can get more specific
      error do
        status 500
        erb :'500.html', layout: :'admin_layout.html'
      end
    end
  end
end
