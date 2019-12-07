# frozen_string_literal: true

module Apollo
  module Models
    class Post
      include Mongoid::Document
      include Mongoid::Timestamps

      field :name, type: String
      field :slug, type: String

      embeds_many :translations do
        def find_by_language(language)
          where(language: language).first
        end
      end

      field :draft, type: Boolean
      field :author, type: String

      field :tags, type: Set
      field :categories, type: Set

      def content
        self.translations.find_by_language(I18n.locale)&.content
      end

    end
  end
end
