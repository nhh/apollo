require_relative 'lib/apollo'

Gem::Specification.new do |s|

  s.name = 'apollo'
  s.version = Apollo::VERSION

  s.summary     = Apollo::SUMMARY
  s.description = Apollo::DESCRIPTION

  s.authors = ['Niklas Hanft']
  s.email = 'hello@niklashanft.com'
  s.homepage = 'https://github.com/nhh/apollo'
  s.license = 'ISC'

  s.files = `git ls-files`.split("\n")
  s.executables << 'apollo'
  s.required_ruby_version = '~> 2.5'

  s.add_runtime_dependency 'bundler'
  s.add_runtime_dependency 'pry'
  s.add_runtime_dependency 'byebug'
  s.add_runtime_dependency 'commander'
  s.add_runtime_dependency 'rake'
  s.add_runtime_dependency 'sinatra', '~> 2.0.7'
  s.add_runtime_dependency 'sinatra-flash'
  s.add_runtime_dependency 'down'
  s.add_runtime_dependency 'http'
  s.add_runtime_dependency 'i18n'

  s.add_runtime_dependency 'zeitwerk'
  s.add_runtime_dependency 'puma', '~> 4'
  s.add_runtime_dependency 'bcrypt'
  s.add_runtime_dependency 'mongoid'
  s.add_runtime_dependency 'rufus-scheduler'
  s.add_runtime_dependency 'sucker_punch'

end
