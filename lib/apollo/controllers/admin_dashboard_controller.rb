# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminDashboardController < Apollo::Controllers::AdminController

      get '/admin/dashboard' do
        erb :'dashboard/index.html', layout: :'admin_layout.html'
      end

    end
  end
end
