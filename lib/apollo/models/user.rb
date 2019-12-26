# frozen_string_literal: true

require 'mongoid'

module Apollo
  module Models
    class User
      include Mongoid::Document
      include Mongoid::Timestamps

      field :name, type: String
      field :email, type: String
      field :password, type: String
      field :enabled, type: Boolean

    end
  end
end
