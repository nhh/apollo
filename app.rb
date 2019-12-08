require 'zeitwerk'
require 'mongoid'
require 'sinatra'
require 'sinatra/flash'
require 'byebug'

loader = Zeitwerk::Loader.new
loader.push_dir("lib")
loader.push_dir("themes")
loader.push_dir("plugins")
loader.push_dir("widgets")

if ENV["APP_ENV"] == "development"
  require 'listen'
  loader.enable_reloading
  listener = Listen.to('lib', 'themes', 'plugins', 'widgets') { |_, _, _| loader.reload }
  listener.start
end

loader.setup
loader.eager_load

# Setup i18n
I18n.load_path << Dir[File.expand_path("config/locales/") + "*.yml"]

# Setup Database
Mongoid.load!("config/mongoid.yml", ENV["APP_ENV"])

puts "Apollo: Connected to database"

Apollo::PluginLoader.load_plugins
Apollo::ThemeLoader.load_themes

use Apollo::Controllers::AdminThemeController
use Apollo::Controllers::AdminPageController
use Apollo::Controllers::AdminPostController
use Apollo::Controllers::AdminUserController
use Apollo::Controllers::AdminPluginController
use Apollo::Controllers::AdminWidgetController
use Apollo::Controllers::AdminDashboardController
use Apollo::Controllers::AdminLoginController

Apollo::ThemeLoader.themes.each {|theme| theme.new.controllers.each {|controller| use controller} }
Apollo::PluginLoader.plugins.each {|plugin| plugin.new.controllers.each { |controller| use controller } }

Sinatra::Application.run!
