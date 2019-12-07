if ENV["development"]
  workers Integer(ENV['WEB_CONCURRENCY'] || 1)
  threads_count = Integer(ENV['MAX_THREADS'] || 16)
  threads threads_count, threads_count

  preload_app!

  rackup DefaultRackup
  port ENV['PORT'] || 4567
  environment ENV['RACK_ENV'] || 'development'
end

if ENV["production"]
  workers Integer(ENV['WEB_CONCURRENCY'] || 2)
  threads_count = Integer(ENV['MAX_THREADS'] || 16)
  threads threads_count, threads_count

  rackup DefaultRackup
  port ENV['PORT'] || 4567
  environment ENV['RACK_ENV'] || 'production'
end
