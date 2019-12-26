# frozen_string_literal: true

require 'singleton'
require 'rufus-scheduler'
require 'logger'

module Apollo
  module Core
    # The class for registering all jobs
    #
    # It is responsible for keeping all track of jobs
    # Todo We may want to check configuration if the jobs are disabled
    class JobManager
      include ::Singleton
      attr_accessor :descendants

      def initialize
        @descendants = []
        @logger =  ::Logger.new(STDOUT)
        @scheduler = Rufus::Scheduler.new
      end

      def add(descendant)
        @descendants << descendant
        @logger.info { "An job has been added: #{ descendant }" }
      end

      def load_all
        @descendants.map { |job| job.new }.each do |job|
          @scheduler.send(job.schedule_info[:method], job.schedule_info[:time], job.class)
        end
      end

    end
  end
end
