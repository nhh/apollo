# frozen_string_literal: true

require 'apollo/controllers/admin_controller'

module Apollo
  module Controllers
    class AdminSettingsController < Apollo::Controllers::AdminController

      get '/admin/settings/privacy' do
        erb :'settings/new.html', layout: :'admin_layout.html'
      end

      get '/admin/settings/pages' do
        erb :'settings/new.html', layout: :'admin_layout.html'
      end

      get '/admin/settings' do
        erb :'settings/index.html', layout: :'admin_layout.html'
      end

    end
  end
end
