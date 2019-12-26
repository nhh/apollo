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

      # Saves the configuration with a key and value to the configuration file
      #
      #   configuration = Apollo::Core::Configuration.new
      #   configuration.set("apollo.security.allow_unsigned_gems", false)
      #   configuration.get("apollo.security.allow_unsigned_gems") # returns true
      #
      # Please note, that setting a configuration does NOT set an environment variable
      # @return boolean
      def set(key, value)
        configuration = YAML.load(File.read(@config_path))
        keys = key.split(".")
        # reverse inject turns around the array and adds the value as last item
        # after that we are returning a hash with "out zipping" itself
        configuration = configuration.deep_merge(keys.reverse.inject(value) { |a, n| { n => a } })
        File.write(@config_path, configuration.to_yaml)
        true
      rescue StandardError => e
        false
      end

    end
  end
end
