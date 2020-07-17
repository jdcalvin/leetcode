require_relative 'lib/generator/builder'

APP_PATH = Dir.pwd
Dir["./app/**/*.rb"].each { |f| require_relative(f) }