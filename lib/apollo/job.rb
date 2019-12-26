# frozen_string_literal: true

require 'sucker_punch'

require 'apollo/core/job_manager'

module Apollo
  # Central module for jobs. Either future, recurring, cron or one timers.
  #
  # Example usage:
  #   class CsvImportJob
  #     include Apollo::Job
  #
  #     schedule :every, '5min', :hello
  #
  #     def hello
  #       puts "Hello world"
  #     end
  #
  #   end
  module Job

    # Registers the job within the job manager for being picked up for scheduling
    #
    def self.included(klass)
      klass.extend KlassMethods
      # Dynamically including the SuckerPunch Job module
      klass.class_eval do
        include SuckerPunch::Job
      end

      Apollo::Core::JobManager.instance.add klass
    end

    # Dynamic definition of class methods for dealing with the schedule macro
    # These information are being used for registering all job classes to the job scheduler
    #
    # WARNING: Actually there is a limitation. The usage of:
    #   class CsvImportJob
    #     include Apollo::Job
    #
    #     schedule :every, '5min', :hello
    #     schedule :in, '15min', :hello
    #
    #     def hello
    #       puts "Hello world"
    #     end
    #
    #   end
    # Is not possible, because two or more usages of schedule will override the schedule_info, perform and call methods
    module KlassMethods
      def schedule(type, time, method)
        raise ArgumentError unless [:every, :at, :in, :cron].include? type
        raise ArgumentError unless time
        raise ArgumentError unless method

        # What about passing the scheduler instance here to register the schedules
        define_method(:schedule_info) do
          {
              method: type,
              time: time
          }
        end

        define_method(:perform) do
          self.send(method)
        end

        # This is a method used at the rufus scheduler, scheduling the method perform on the sucker punch job
        # Which dynamically calls the method from the instance we defined
        define_method(:call) do
          self.class.perform_async
        end

      end
    end

  end

end
