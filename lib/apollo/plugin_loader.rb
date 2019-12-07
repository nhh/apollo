# frozen_string_literal: true

module Apollo
  class PluginLoader
    @plugins = Set.new

    class << self
      attr_reader :plugins
    end

    def self.load_plugins

      # Todo replace with a ruby native method
      ObjectSpace.each_object(Class).select { |klass| klass < Apollo::Plugin }.each do |plugin|
        @plugins << plugin
      end

      @plugins.each { |plugin| puts "PluginLoader loaded => #{plugin.new.name}" }
    end

  end
end
