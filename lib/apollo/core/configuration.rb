# frozen_string_literal: true

require 'yaml'

module Apollo
  module Core
    # The central class for working with environment variables and configuration files
    #
    # There is a chicken egg problem, so a "configuration path" is needed to actually load the configuration file
    class Configuration

      def initialize
        @config_path = ENV["CONFIG_PATH"] ||= '/etc/apollo/apollo.yaml'
      end

      # Retrieves the key from the configuration file
      # If a environment variable exists, it will be returned first. So all yaml config can be overriden by an env variable
      def get(key)
        return ENV[key.gsub(".", "_").upcase] if ENV[key.gsub(".", "_").upcase]

        configuration = YAML.load(File.read(@config_path))
        configuration.dig(*key.split("."))
      end

    end
  end
end
