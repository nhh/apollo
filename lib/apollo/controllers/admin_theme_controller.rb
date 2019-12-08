# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminThemeController < Apollo::Controllers::AdminController

      get '/admin/themes' do
        @themes = Apollo::Theme.descendants
        erb :'themes/index.html', layout: :'layout.html'
      end

      get '/admin/themes/marketplace' do
        erb :'themes/marketplace.html', layout: :'layout.html'
      end

      get '/admin/themes/:template_name' do |theme_name|
        @theme = Apollo::Theme.descendants.detect {|theme| theme.name == theme_name }
        erb :'themes/show.html', layout: :'layout.html'
      end

    end
  end
end
