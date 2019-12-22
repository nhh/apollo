require 'zeitwerk'
require 'mongoid'
require 'rufus-scheduler'
require 'sucker_punch'
require "http"
require "down/http"
require 'sinatra'
require 'sinatra/flash'
require 'byebug'

loader = Zeitwerk::Loader.new
loader.push_dir(File.expand_path('../lib', __FILE__))

loader.setup
loader.eager_load

bootstrapper = Apollo::Core::AddonBootstrapper.new

# Todo make this configurable and put into appropriate file/class
Dir.glob("/var/lib/apollo/addons/*.gem") do |addon|
  bootstrapper.install_addon addon
  begin
    require addon.gsub("/var/lib/apollo/addons/", "").split("-")[0]
  rescue StandardError => e
    puts "ERROR: Cannot load addon: #{addon.gsub("/var/lib/apollo/addons/", "").split("-")[0]}"
  end
end

scheduler = Rufus::Scheduler.new

# Storing a reference of the descendants for avoiding gc
jobs = Apollo::Core::JobManager.instance.descendants
jobs.map { |job| job.new }.each do |job|
  scheduler.send(job.schedule_info[:method], job.schedule_info[:time], job.class)
end

# Setup i18n
I18n.load_path << Dir[File.expand_path("../config/locales/", __FILE__) + "*.yml"]

# Setup Database
Mongoid.load!(File.expand_path("../config/mongoid.yml", __FILE__), ENV["APP_ENV"])

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
