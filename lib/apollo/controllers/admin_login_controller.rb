# frozen_string_literal: true

require 'apollo/helpers/admin_navigation'

module Apollo
  module Controllers
    class AdminLoginController < Apollo::Controllers::AdminController

      get '/login' do
        erb :'login/index.html'
      end

      post '/login' do
        session["logged_in"] = true
        redirect "/admin/dashboard"
      end

    end
  end
end
