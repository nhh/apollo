module Apollo
  module Utils
    class Path

      # Returns the base base as absolute file path
      #
      def self.base(addon_id)
        String.new __dir__.gsub("lib/apollo/utils", "data/") + addon_id
      end

      # Creates a directory in the correct namespace for the plugin
      #
      def self.mkdir(addon_id)
        Dir.mkdir(self.base(addon_id))
      end

      # Creates a directory in the correct namespace for the plugin
      #
      def self.rmdir(addon_id)
        FileUtils.rm_rf(self.base(addon_id))
      end

      # Indicates a directory exists
      #
      def self.exists?(addon_id)
        File.exists? self.base addon_id
      end

    end
  end
end
