require 'zeitwerk'
require 'mongoid'
require 'rufus-scheduler'
require 'sucker_punch'
require 'byebug'
require "http"
require "down/http"
require 'sinatra'
require 'sinatra/flash'

loader = Zeitwerk::Loader.new
loader.push_dir("lib")
loader.push_dir("addons")

loader.setup
loader.eager_load

scheduler = Rufus::Scheduler.new

# Storing a reference of the descendants for avoiding gc
jobs = Apollo::Core::JobManager.instance.descendants
jobs.map { |job| job.new }.each do |job|
  scheduler.send(job.schedule_info[:method], job.schedule_info[:time], job.class)
end

# Setup i18n
I18n.load_path << Dir[File.expand_path("config/locales/") + "*.yml"]

# Setup Database
Mongoid.load!("config/mongoid.yml", ENV["APP_ENV"])

puts "Apollo: Connected to database"

use Apollo::Controllers::AdminAddonController
use Apollo::Controllers::AdminPageController
use Apollo::Controllers::AdminPostController
use Apollo::Controllers::AdminUserController
use Apollo::Controllers::AdminSettingsController
use Apollo::Controllers::AdminAttachmentController
use Apollo::Controllers::AdminDashboardController
use Apollo::Controllers::AdminLoginController

# Storing a reference of the descendants for avoiding gc
controllers = Apollo::Core::AddonManager.instance.descendants.map {|addon| addon.new }
controllers.each {|addon| addon.controllers.each {|controller| use controller } }

Sinatra::Application.run!
