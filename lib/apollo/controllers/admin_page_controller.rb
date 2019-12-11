# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminPageController < Apollo::Controllers::AdminController

      get '/admin/pages/new' do
        @page = Apollo::Models::Page.new
        erb :'pages/new.html', layout: :'admin_layout.html'
      end

      get '/admin/pages' do
        @pages = Apollo::Models::Page.all
        erb :'pages/index.html', layout: :'admin_layout.html'
      end

      post '/admin/pages' do
        page = Apollo::Models::Page.new

        translation = Apollo::Models::Translation.new


        translation.language = I18n.locale
        translation.content = params.dig('page', 'content')

        page.translations << translation

        page.name = params.dig('page', 'name')
        page.slug = params.dig('page', 'name').downcase.gsub(' ', '-')

        page.categories << 'NEW'
        page.draft = params.dig('page', 'draft') == 'true'

        if page.valid?
          page.save
          flash[:success] = { message: '' }
          redirect '/admin/pages'
        end
      end

    end
  end
end
