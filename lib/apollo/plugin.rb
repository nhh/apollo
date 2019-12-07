# frozen_string_literal: true

require 'sinatra/base'

module Apollo
  class Plugin
    attr_accessor :name, :type, :id
    def self.controllers
      []
    end
  end
end
