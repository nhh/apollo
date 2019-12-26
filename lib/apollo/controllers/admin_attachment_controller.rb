# frozen_string_literal: true

require 'apollo/controllers/admin_controller'
require 'apollo/models/attachment'

module Apollo
  module Controllers
    class AdminAttachmentController < Apollo::Controllers::AdminController

      get '/admin/attachments/new' do
        @attachment = Apollo::Models::Attachment.new
        erb :'attachments/new.html', layout: :'admin_layout.html'
      end

      get '/admin/attachments' do
        @attachments = Apollo::Models::Attachment.all
        erb :'attachments/index.html', layout: :'admin_layout.html'
      end

      post '/admin/attachments' do
        throw NotImplementedError
      end

    end
  end
end
