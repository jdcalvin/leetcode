require_relative 'lib/generator/builder'
Dir["./app/**/*.rb"].each { |f| require_relative(f) }