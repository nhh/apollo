module Apollo
  module Core
    # The class for registering all jobs
    #
    # It is responsible for keeping all track of jobs
    class JobManager
      include Singleton
      attr_accessor :descendants

      def initialize
        @descendants = []
        @logger =  Logger.new(STDOUT)
      end

      def add(descendant)
        descendants << descendant
        @logger.info { "An job has been added: #{ descendant }" }
      end

    end
  end
end
