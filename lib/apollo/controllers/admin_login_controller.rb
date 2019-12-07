# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminLoginController < AdminController

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
