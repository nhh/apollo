# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminPostController < Apollo::Controllers::AdminController

      get '/admin/posts/new' do
        @post = Apollo::Models::Post.new
        erb :'posts/new.html', layout: :'layout.html'
      end

      get '/admin/posts' do
        @posts = Apollo::Models::Post.all
        erb :'posts/index.html', layout: :'layout.html'
      end

      post '/admin/posts' do
        post = Apollo::Models::Post.new
        post.name = params.dig('post', 'name')

        translation = Apollo::Models::Translation.new


        translation.language = I18n.locale
        translation.content = params.dig('post', 'content')

        post.translations << translation

        post.slug = params.dig('post', 'name').downcase.gsub(' ', '-')
        post.categories << 'NEW'
        post.draft = params.dig('post', 'draft') == 'true'

        if post.valid?
          post.save
          flash[:success] = { message: '' }
          redirect '/admin/posts'
        end
      end

    end
  end
end