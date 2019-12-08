# frozen_string_literal: true

module Apollo
  class Theme
    attr_accessor :name, :type, :id

    def controllers
      []
    end

    def models
      []
    end

    def self.descendants
      ObjectSpace.each_object(Class).select { |klass| klass < Apollo::Theme }.map { |theme| theme.new }
    end

  end
end
