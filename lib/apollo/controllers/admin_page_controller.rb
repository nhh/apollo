# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminPageController < Apollo::Controllers::AdminController

      get '/admin/pages/new' do
        @page = Apollo::Models::Page.new
        erb :'pages/new.html', layout: :'layout.html'
      end

      get '/admin/pages' do
        @pages = Apollo::Models::Page.all
        erb :'pages/index.html', layout: :'layout.html'
      end

      post '/admin/pages' do
        post = Apollo::Models::Page.new
        post.name = params.dig('post', 'name')
        post.content = params.dig('post', 'content')
        post.slug = params.dig('post', 'name').downcase.gsub(' ', '-')
        post.category = 'NEW'
        post.draft = params.dig('post', 'draft') == 'true'

        if post.valid?
          post.save
          flash[:success] = { message: '' }
          redirect '/admin/pages'
        end
      end

    end
  end
end
