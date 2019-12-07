# frozen_string_literal: true

module Apollo
  module Models
    class Page
      include Mongoid::Document
      include Mongoid::Timestamps

      field :name, type: String
      field :slug, type: String

      #embeds_many :rows //=> embeds_many :columns

      field :draft, type: Boolean
      field :author, type: String

      field :tags, type: Set
      field :categories, type: Set

    end
  end
end
