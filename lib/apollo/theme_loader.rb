# frozen_string_literal: true

module Apollo
  class ThemeLoader
    @themes = Set.new

    class << self
      attr_reader :themes
    end

    def self.load_themes

      ObjectSpace.each_object(Class).select { |klass| klass < Apollo::Theme }.each do |theme|
        @themes << theme
      end

      @themes.each { |theme| puts "ThemeLoader loaded => #{theme.new.name}" }
    end

  end
end
