# frozen_string_literal: true

require 'sinatra/base'

module Apollo
  class Plugin
    attr_accessor :name, :type, :id

    def controllers
      []
    end

    def self.descendants
      ObjectSpace.each_object(Class).select { |klass| klass < Apollo::Plugin }.map { |plugin| plugin.new }
    end

  end
end
