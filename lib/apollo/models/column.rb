require 'mongoid'

module Apollo
  module Models
    class Column
      include Mongoid::Document
      embedded_in :page
      embedded_in :post

      validates :size , inclusion: { in: 1..12, message: 'The height must be between 1 and 12' }

      field :content, type: String
      field :size, type: Integer

    end
  end
end
