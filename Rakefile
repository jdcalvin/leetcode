  
require 'pry'
require 'optparse'

task :console do
  def reload
    load 'app.rb'
  end
  reload
  Pry.start
end


task :generate, :problem do |t, args|
  load 'lib/generator/builder.rb'
  problem = args.problem
  b = Builder.new(problem)
  b.create_files!

  puts "Created:"
  puts b.problem_name_file_path
  puts b.problem_name_spec_file_path
end


task :hi, :hey do |t, args|
  puts args
end