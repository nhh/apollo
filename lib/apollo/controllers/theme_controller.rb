# frozen_string_literal: true

module Apollo
  module Controllers
    class ThemeController < Sinatra::Base
      register ::Sinatra::Flash

      configure do
        set(:views, proc { File.join(root, '../../..', 'themes', ENV['APP_THEME'], 'views') })
        set(:public_folder, proc { File.join(root, '../../..', 'themes', ENV['APP_THEME'], 'assets') })

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

      error Apollo::Errors::EntityNotFoundError do
        status 404
        erb :'404.html', layout: :'layout.html'
      end

      error do
        status 500
        erb :'500.html', layout: :'layout.html'
      end

      not_found do
        status 404
        erb :'404.html', layout: :'layout.html'
      end

    end
  end
end
