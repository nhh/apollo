# frozen_string_literal: true

module Apollo
  class Widget
    attr_accessor :name, :type, :id

    def component
      []
    end

    def self.descendants
      ObjectSpace.each_object(Class).select { |klass| klass < Apollo::Widget }.map { |widget| widget.new }
    end

  end
end
