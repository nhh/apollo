# frozen_string_literal: true

require 'apollo/helpers/admin_navigation'

module Apollo
  module Controllers
    class AdminDashboardController < Apollo::Controllers::AdminController

      get '/admin/dashboard' do
        erb :'dashboard/index.html', layout: :'admin_layout.html'
      end

    end
  end
end
