# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminUserController < Apollo::Controllers::AdminController

      get '/admin/users/new' do
        @user = Apollo::Models::User.new
        erb :'users/new.html', layout: :'admin_layout.html'
      end

      get '/admin/users' do
        @users = Apollo::Models::User.all
        erb :'users/index.html', layout: :'admin_layout.html'
      end

      post '/admin/users' do
        post = Apollo::Models::User.new
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
