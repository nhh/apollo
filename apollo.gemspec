lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "apollo/version"

Gem::Specification.new do |s|

  s.name = 'apollo'
  s.version = Apollo::VERSION

  s.summary     = "Summary"
  s.description = "Description"

  s.authors = ['Niklas Hanft']
  s.email = 'hello@niklashanft.com'
  s.homepage = 'https://github.com/nhh/apollo'
  s.license = 'ISC'

  s.files = `git ls-files`.split("\n")
  s.executables << 'apollo'
  s.required_ruby_version = '~> 2.5'
  s.require_path = 'lib'

  # Dependencies
  s.add_dependency 'omniauth'
  s.add_dependency 'commander'
  s.add_dependency 'rake'
  s.add_dependency 'sinatra', '~> 2.0.7'
  s.add_dependency 'sinatra-flash'
  s.add_dependency 'down'
  s.add_dependency 'http'
  s.add_dependency 'i18n'

  s.add_dependency "activesupport", "~> 4.2.0"
  s.add_dependency 'puma', '~> 4'
  s.add_dependency 'bcrypt'
  s.add_dependency 'mongoid'
  s.add_dependency 'rufus-scheduler'
  s.add_dependency 'sucker_punch'

  # Development Dependencies
  s.add_development_dependency 'pry'
  s.add_development_dependency 'byebug'
  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"

end
