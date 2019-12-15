module Apollo
  module Models
    class Attachment
      include Mongoid::Document

      validates :mime_type, presence: true

      field :mime_type, type: String
      field :name, type: String
      field :tags, type: Set
      field :addon_id, type: String

      # Converts the object into textual markup given a specific format.
      #
      # @param file [File] the input must be from type file
      # @param addon_id [String] indicates this file comes from an addon. This is necessary for the uninstall action removing downloaded assets.
      #
      # Examples:
      # Apollo attachment:
      #   attachment = Attachment.new(File.new("/var/www/downloads/product-description.pdf"))
      # Addon attachment:
      #   attachment = Attachment.new(File.new("/var/www/downloads/product-description.pdf"), "my-plugin")
      def initialize(file, addon_id="apollo")
        throw StandardError if file.readable?
        addon_id = addon_id
        file = file
      end

      def url
        # Return e.g https://niklashanft.com/attachments/ID
      end

      # @deprecated Use {#path} instead of this method because
      #   it uses a library that is no longer supported in Ruby 1.9.
      #   The new method accepts the same parameters.
      #   IMPORTANT: This method will be removed in Apollo 2.1
      def file_path

      end

      def path
        String.new("")
      end

      def self.download_and_create!(url)
        # Todo download url and save under data/apollo/attachments
      end

      def size

      end

      def destroy
        File.unlink(file_path)
        super.destroy
      end

      def save
        File.open(path, "rw") do |output|
          file.each_line.lazy.each {|line| output.write(line)}
        end
        super.save
      end

      private

      attr_accessor :file

    end
  end
end
