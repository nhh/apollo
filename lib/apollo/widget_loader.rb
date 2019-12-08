# frozen_string_literal: true

module Apollo
  class WidgetLoader
    @widgets = Set.new

    class << self
      attr_reader :widgets
    end

    def self.load_themes

      ObjectSpace.each_object(Class).select { |klass| klass < Apollo::Widget }.each do |widget|
        @widgets << widget
      end

      @widgets.each { |widget| puts "ThemeLoader loaded => #{widget.new.name}" }
    end

  end
end
