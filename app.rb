require 'zeitwerk'
require 'mongoid'
require 'sinatra'
require 'sinatra/flash'
require 'byebug'
require "http"
require "down/http"

loader = Zeitwerk::Loader.new
loader.push_dir("lib")
loader.push_dir("addons")
loader.push_dir("widgets")

if ENV["APP_ENV"] == "development"
  require 'listen'
  loader.enable_reloading
  listener = Listen.to('lib', 'addons', 'widgets') { |_, _, _| loader.reload }
  listener.start
end

loader.setup
loader.eager_load

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
use Apollo::Controllers::AdminWidgetController
use Apollo::Controllers::AdminDashboardController
use Apollo::Controllers::AdminLoginController

Apollo::Addon.descendants
  .map {|addon| addon.new }
  .each {|addon| addon.controllers.each {|controller| use controller } }

Sinatra::Application.run!
