# frozen_string_literal: true

module Apollo
  class Addon
    attr_accessor :name, :type, :id, :version,

    def self.inherited(subclass)
      # Eager loading all classes via zeitwerk pushes these class into the descendants
      @descendants ||= []
      @descendants << subclass
    end

    def self.descendants
      @descendants
    end

    def controllers
      []
    end

    def models
      []
    end

    def self.theme
      descendants.map{|addon| addon.new }.detect { |addon| addon.theme? }
    end

    def theme?
      false
    end

  end
end
