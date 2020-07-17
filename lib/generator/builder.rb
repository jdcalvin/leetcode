require 'erb'
require 'humanize'
require 'ostruct'
class Builder

  APP_PATH = Dir.pwd
  MODULE_ERB = APP_PATH + '/lib/generator/problem.erb'
  SPEC_ERB = APP_PATH + '/lib/generator/problem_spec.erb'

  MODULE_PATH = APP_PATH + '/app/problems/'
  SPEC_PATH = APP_PATH + '/spec/problems/'

  attr_reader :problem_name
  def initialize(problem_name)
    @problem_name = problem_name
  end

  def problem_name_constantized
    parse_name_to_arr.map(&:capitalize).join('')
  end

  def problem_name_snake_case
    parse_name_to_arr.join('_')
  end

  def module_content
    ERB.new(File.read(MODULE_ERB)).result(namespace.instance_eval { binding })
  end

  def spec_content
    ERB.new(File.read(SPEC_ERB)).result(namespace.instance_eval { binding })
  end

  def problem_name_file_path
    File.join(MODULE_PATH, problem_name_snake_case + '.rb')
  end

  def problem_name_spec_file_path
    File.join(SPEC_PATH, problem_name_snake_case + '_spec.rb')
  end

  def create_files!
    File.open(problem_name_file_path, 'w') do |f|
      f.puts module_content
    end

    File.open(problem_name_spec_file_path, 'w') do |f|
      f.puts spec_content
    end
  end

  def namespace
    OpenStruct.new(problem_name_constantized: problem_name_constantized, problem_name_snake_case: problem_name_snake_case)
  end

  private

  def parse_name_to_arr
    problem_name.gsub(/[0-9]/) {|x| '-' + x.to_i.humanize + '-' }
                .split(/[-_ ]+/)
                .select {|x| x.length > 0}
  end
end