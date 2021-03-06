# frozen_string_literal: true

require 'rubygems/commands/install_command'
require 'rubygems/commands/uninstall_command'

module Apollo

  module Core

    # Todo for info: Gem::Specification::find_by_name(gem_name)
    class AddonBootstrapper

      def install_addon(name)
        # Todo check versioning and verify installation
        cmd = Gem::Commands::InstallCommand.new
        cmd.handle_options [name, "--no-document"] # This is an array
        cmd.execute
      rescue Gem::SystemExitException => e
        return true if e.exit_code == 0
        puts "FAILURE: #{e.exit_code}"
        false
      end

      def uninstall_addon(name)
        cmd = Gem::Commands::UninstallCommand.new
        cmd.handle_options ['-x', '-I', name]  # -x removes executables without prompting. -I ignores dependecies. Can also uninstall specific versions...
        cmd.execute
      rescue Gem::SystemExitException => e
        return true if e.exit_code == 0
        puts "FAILURE: #{e.exit_code}"
        false
      end

      # Todo use Database list instead
      def list_addons
        Dir.glob("/var/lib/apollo/addons/*.gem")
      end

      def load_addon(name)
        begin
          require name.gsub("/var/lib/apollo/addons/", "").split("-")[0]
        rescue StandardError => e
          puts "ERROR: Cannot load addon: #{name.gsub("/var/lib/apollo/addons/", "").split("-")[0]}"
        end
      end

    end

  end

end
