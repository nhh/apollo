# frozen_string_literal: true

module Apollo
  class Addon
    attr_accessor :name, :type, :id, :version,

    def self.inherited(subclass)
      # Eager loading all classes via zeitwerk pushes these class into the descendants
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
      Apollo::Core::AddonManager.instance.descendants.map{|addon| addon.new }.detect { |addon| addon.theme? }
    end

    def theme?
      false
    end

  end
end
