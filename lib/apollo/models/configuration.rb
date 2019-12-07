# frozen_string_literal: true

module Apollo
  module Models
    class Configuration
      include Mongoid::Document
      include Mongoid::Timestamps

      field :name, type: String
      field :data, type: Hash

      validates :name, :data, presence: true
    end
  end
end
