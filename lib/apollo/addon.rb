# frozen_string_literal: true

module Apollo
  class Addon
    attr_accessor :name, :type, :id, :version,

    def controllers
      []
    end

    def models
      []
    end

    def self.descendants
      ObjectSpace.each_object(Class).select { |klass| klass < Apollo::Addon }.map { |addon| addon.new }
    end

    def self.theme
      descendants.detect { |addon| addon.theme? }
    end

    def theme?
      false
    end

  end
end
