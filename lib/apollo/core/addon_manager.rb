module Apollo
  module Core
    class AddonManager
      include Singleton
      attr_accessor :descendants

      def initialize
        @descendants = []
      end

      def add(descendant)
        descendants << descendant
      end

      # Checks if a plugin is available, installed and activated
      def exists?(addon_id)
        # Todo Implement a Database Model for Addons where we can check the installation date and or enabled / disabled state
        addon = @descendants.map {|addon| addon.new }.detect {|addon| addon.id == addon_id}
        addon.nil?
      end

    end
  end
end
