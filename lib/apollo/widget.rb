# frozen_string_literal: true

module Apollo
  class Widget
    attr_accessor :name, :type, :id

    def component
      []
    end

    def self.inherited(subclass)
      # Eager loading all classes via zeitwerk pushes these class into the descendants
      Apollo::Core::WidgetManager.instance.add subclass
    end

    def self.descendants
      Apollo::Core::WidgetManager.instance.descendants
    end

  end
end
