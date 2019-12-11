module Apollo
  module Core
    class WidgetManager
      include Singleton
      attr_accessor :descendants

      def initialize
        @descendants = []
      end

      def add(descendant)
        @descendants << descendant
      end

    end
  end
end
