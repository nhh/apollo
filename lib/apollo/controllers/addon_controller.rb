# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'

require 'apollo/helpers/admin_navigation'
require 'apollo/errors/entity_not_found_error'
require 'apollo/models/user'

module Apollo
  module Controllers
    class AddonController < Sinatra::Base
      include Apollo::Helpers::AdminNavigation
      register ::Sinatra::Flash

      def find_template(views, name, engine, &block)
        Array(views).each do |v|
          if v.is_a?(Proc)
            super(v.call, name, engine, &block)
          else
            super(v, name, engine, &block)
          end
        end
      end

      configure do

        set :views, [
          proc { File.expand_path('../../views', __FILE__) },
          File.join(root, '..', 'views')
        ]

        set(:public_folder, proc { File.expand_path('../../views', __FILE__) })

        set(:show_exceptions, proc { ENV['APP_ENV'] == 'development' || ENV['APP_ENV'].nil? })
        set(:raise_errors, proc { ENV['APP_ENV'] == 'development' || ENV['APP_ENV'].nil? })
        enable :sessions
      end

      protected

      def logged_in?
        !session[:user_id].nil?
      end

      def current_user
        Apollo::Models::User[session[:user_id]]
      end

      error Apollo::Errors::EntityNotFoundError do
        status 404
        erb :'404.html', layout: :'admin_layout.html'
      end

      error do
        status 500
        erb :'500.html', layout: :'admin_layout.html'
      end

      not_found do
        status 404
        erb :'404.html', layout: :'admin_layout.html'
      end

    end
  end
end
