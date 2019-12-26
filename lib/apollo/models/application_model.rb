# frozen_string_literal: true
require 'mongoid'

module Apollo
  module Models
    class ApplicationModel
      include Mongoid::Document
      include Mongoid::Timestamps

    end
  end
end
