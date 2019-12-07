require 'sequel'

DB = Sequel.connect('postgres://postgres:postgres@localhost/postgres')

RSpec.configure do |config|
  config.before(:all) { }
  config.after(:all) { }
  #config.before(:suite) { puts 'Before :suite' }
  #config.after(:suite) { puts 'After :suite' }
  config.around(:each) do |example|
    DB.transaction(:rollback=>:always, :auto_savepoint=>true){example.run}
  end
end
