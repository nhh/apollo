# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminUserController < Apollo::Controllers::AdminController

      get '/admin/users/new' do
        @user = Apollo::Models::User.new
        erb :'users/new.html', layout: :'admin_layout.html'
      end

      get '/admin/users' do
        @users = Apollo::Models::User.all
        erb :'users/index.html', layout: :'admin_layout.html'
      end

      post '/admin/users' do
        user = Apollo::Models::User.new
        raise NotImplementedError
      end

    end
  end
end
