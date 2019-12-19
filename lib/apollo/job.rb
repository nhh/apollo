module Apollo


  # Central class for jobs. Either future, recurring, cron or one timers.
  #
  # Example usage:
  #   class CsvImportJob < Apollo::Job
  #
  #     schedule :every, '5min', :hello
  #
  #     def hello
  #       puts "Hello world"
  #     end
  #
  #   end
  class Job
    include SuckerPunch::Job

    # Registers the job within the job manager for being picked up for scheduling
    #
    def self.inherited(subclass)
      Apollo::Core::JobManager.instance.add subclass
    end

    # Delegates the descendants to the JobManager singleton
    # @return Array
    def self.descendants
      Apollo::Core::JobManager.instance.descendants
    end

    # Dynamic definition of scheduling information methods
    # These information are being used for registering all job classes to the job scheduler
    #
    # WARNING: Actually there is a limitation. The usage of:
    #   class CsvImportJob < Apollo::Job
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
    def self.schedule(type, time, method)
      raise ArgumentError unless [:every, :at, :in, :cron].include? type

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
