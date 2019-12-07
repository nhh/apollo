
module Apollo
  module Models
    class Translation
      include Mongoid::Document
      embedded_in :page
      embedded_in :post

      field :language, type: String
      field :content, type: String

    end
  end
end
