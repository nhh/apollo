# frozen_string_literal: true

module Apollo

  # The central addon class
  #
  # Here users can register their addons for extending apollo
  # This is an example of a very basic plugin extension
  #
  #   addons/my-addon/addon.rb
  #
  #   module MyAddon
  #     class Addon < Apollo::Addon
  #
  #       def initialize
  #         @version = "1.0.0"
  #         @id = "my-version"
  #         @author = "Niklas Hanft"
  #         @type = :addon
  #         super
  #       end
  #
  #       def install
  #         puts "I am called on installation"
  #       end
  #
  #       def uninstall
  #         puts "I am called on uninstall"
  #       end
  #
  #       def enable
  #         puts "I am called on enable"
  #       end
  #
  #       def disable
  #         puts "I am called on disable"
  #       end
  #
  #     end
  #   end
  #
  class Addon

    # The unique identifier for the addon
    attr_accessor :uid

    # The addon name, choose something descriptive
    attr_accessor :name

    # Wheter the addon is a ":widget", a ":theme" or an ":addon"
    attr_accessor :type

    # Semver look at https://semver.org/
    attr_accessor :version

    def initialize
      @theme = false
    end

    # Registers a custom callback to ensure working with all inherited addons
    #
    def self.inherited(subclass)
      Apollo::Core::AddonManager.instance.add subclass
    end

    def self.descendants
      Apollo::Core::AddonManager.instance.descendants
    end

    def controllers
      []
    end

    def models
      []
    end

    def self.theme
      Apollo::Core::AddonManager.instance.descendants.map {|addon| addon.new }.detect { |addon| addon.theme? }
    end

    def theme?
      @theme
    end

  end
end
