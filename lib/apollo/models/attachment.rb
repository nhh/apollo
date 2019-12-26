# frozen_string_literal: true

require 'open-uri'
require 'mongoid'
require 'fileutils'
require 'down/http'

require 'apollo/utils/path'

module Apollo
  module Models

    # The attachment class is the central class for working with images and other kind of files
    # attachment currently supports the following prefixes for file_urls: ["http://", "https://", "file://"]
    #
    # Apollo attachment:
    #   attachment = Attachment.new
    #   attachment.url = "file:///var/www/downloads/product-description.pdf"
    #
    # Addon attachment:
    #   attachment = Attachment.new
    #   attachment.url = "file:///var/www/downloads/product-description.pdf"
    #   attachment.addon_id = "my-plugin"
    #   attachment.valid? => true
    #   attachment.url = "https://example.com/images/test.pdf"
    #   attachment.addon_id = "my-plugin"
    #   attachment.valid? => true
    #
    class Attachment
      include Mongoid::Document

      validates :mime_type, :name, :addon_id, :file_url, presence: true

      field :mime_type, type: String
      field :name, type: String
      field :tags, type: Set
      field :addon_id, type: String, default: "apollo"
      field :file_url, type: String
      field :file_size, type: String

      before_save :update_file
      before_destroy :delete_file

      # Returns the absolute path of the file, whether its saved or not.
      #
      # Example:
      #   attachment.path => "/Users/USERNAME/Development/Ruby/apollo/data/apollo/attachments/5df68ebf4a426f8324d931a3"
      def path
        Apollo::Utils::Path.base("#{addon_id}/attachments/#{id.to_s}")
      end

      protected

      def delete_file
        ::FileUtils.remove_file path, :force => true
      end

      def update_file
        return unless self.changed_attributes.keys.include? "file_url"

        case ::URI.parse(self.file_url).scheme

        when "http"
          io = ::Down::Http.open(file_url)
        when "https"
          io = ::Down::Http.open(file_url)
        when "file"
          io = open(file_url.sub(%r{^file://}, ''))
        else
          throw ArgumentError "Please provide a valid file url"
        end

        self.file_size = IO.copy_stream(io, File.open(path, "w"))
      end

    end
  end
end
