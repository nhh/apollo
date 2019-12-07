# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminPluginController < Apollo::Controllers::AdminController

      get '/admin/plugins' do
        @plugins = Apollo::PluginLoader.plugins.map(&:new)
        erb :'plugins/index.html', layout: :'layout.html'
      end

      get '/admin/plugins/:name' do |_id|
        erb :'plugins/show.html', layout: :'layout.html'
      end

    end
  end
end
