# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminSettingsController < Apollo::Controllers::AdminController

      get '/admin/settings/privacy' do
        @user = Apollo::Models::User.new
        erb :'settings/new.html', layout: :'admin_layout.html'
      end

      get '/admin/settings/pages' do
        @user = Apollo::Models::User.new
        erb :'settings/new.html', layout: :'admin_layout.html'
      end

      get '/admin/settings' do
        erb :'settings/index.html', layout: :'admin_layout.html'
      end

    end
  end
end
