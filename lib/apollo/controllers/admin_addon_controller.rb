# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminAddonController < Apollo::Controllers::AdminController

      get '/admin/addons' do
        @themes = Apollo::Addon.descendants
        erb :'addons/index.html', layout: :'admin_layout.html'
      end

      get '/admin/addons/:addon_name' do |addon_name|
        @theme = Apollo::Addon.descendants.detect {|theme| theme.name == addon_name }
        erb :'addons/show.html', layout: :'admin_layout.html'
      end

    end
  end
end
