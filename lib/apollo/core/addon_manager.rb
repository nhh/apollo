module Apollo
  module Core
    # The class for registering all addons
    #
    # It is responsible for keeping all track of addons
    class AddonManager
      include Singleton
      attr_accessor :descendants

      def initialize
        @descendants = []
        @logger =  Logger.new(STDOUT)
      end

      def add(descendant)
        descendants << descendant
        @logger.info { "An class has been added: #{ descendant }" }
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
