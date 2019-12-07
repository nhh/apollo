# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminThemeController < Apollo::Controllers::AdminController

      get '/admin/themes' do
        @themes = load_all_themes
        erb :'themes/index.html', layout: :'layout.html'
      end

      get '/admin/themes/marketplace' do
        erb :'themes/marketplace.html', layout: :'layout.html'
      end

      get '/admin/themes/:template_name' do |template_name|
        @theme = load_theme_metadata template_name
        erb :'themes/show.html', layout: :'layout.html'
      end

      private

      def load_all_themes
        Dir.entries('themes').map do |entry|
          theme = File.join('themes', entry, 'theme.json')
          next unless File.exist? theme

          JSON.parse File.read theme
        end.compact
      end

      def load_theme_metadata(name)
        JSON.parse File.read File.join('themes', name, 'theme.json')
      rescue Errno::ENOENT
        {}
      end
    end
  end
end
