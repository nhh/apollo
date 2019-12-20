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
  module Addon

    # Registers a custom callback to ensure working with all inherited addons
    #
    def self.included(klass)
      #klass.extend KlassMethods
      # Dynamically including the SuckerPunch Job module
      klass.class_eval do
        #include SuckerPunch::Job
        attr_accessor :uid, :name, :category, :version
      end
      Apollo::Core::AddonManager.instance.add klass
    end

    def self.menu_entries
      []
    end

  end
end
