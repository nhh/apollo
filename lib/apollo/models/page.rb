# frozen_string_literal: true

require 'mongoid'

require 'apollo/models/attachment'

module Apollo
  module Models

    # The page class is used for static content
    #
    class Page
      include Mongoid::Document
      include Mongoid::Timestamps

      embeds_many :columns
      has_and_belongs_to_many :attachments, inverse_of: nil, class_name: "Apollo::Models::Attachment"

      field :thumbnail, type: BSON::ObjectId
      field :name, type: String
      field :slug, type: String
      field :language, type: String

      field :draft, type: Boolean
      field :author, type: String

      field :tags, type: Set
      field :categories, type: Set

      def images
        attachments.where(mime_type: "image/png")
      end

      def thumbnail
        return nil unless super
        Apollo::Models::Attachment.find(super)
      end

      def thumbnail=(thumbnail)
        return super(nil) unless thumbnail
        raise "Expected Apollo::Models::Attachment, got: #{thumbnail.class.name}" unless thumbnail.is_a?(Apollo::Models::Attachment)
        super(thumbnail.id)
      end

    end
  end
end
