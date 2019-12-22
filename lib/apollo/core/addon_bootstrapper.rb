module Apollo

  module Core

    # Todo for info: Gem::Specification::find_by_name(gem_name)
    class AddonBootstrapper
      require 'rubygems/commands/install_command'
      require 'rubygems/commands/uninstall_command'

      def install_addon(name)

        # Todo check versioning and verify installation

        cmd = Gem::Commands::InstallCommand.new
        cmd.handle_options [name, "--no-document", "--local"] # This is an array
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

    end

  end

end
