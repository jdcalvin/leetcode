require 'spec_helper'


RSpec.describe Builder do

  subject {described_class.new(problem_name)}

  let(:problem_name) { '123square66circle' }

  describe 'problem_name_constantized' do
    context 'default' do
      it { expect(subject.problem_name_constantized).to eq 'OneTwoThreeSquareSixSixCircle' }
    end

    context 'spaces' do
      let(:problem_name) { '123 square 66 circle'}
      it { expect(subject.problem_name_constantized).to eq 'OneTwoThreeSquareSixSixCircle' }
    end

    context '_' do
      let(:problem_name) { 'square_66_circle'}
      it { expect(subject.problem_name_constantized).to eq 'SquareSixSixCircle' }
    end
  end

  describe 'problem_name_snake_case' do
    context 'default' do
      it { expect(subject.problem_name_snake_case).to eq 'one_two_three_square_six_six_circle' }
    end

    context 'spaces' do
      let(:problem_name) { '123 square 66 circle'}
      it { expect(subject.problem_name_snake_case).to eq 'one_two_three_square_six_six_circle' }
    end

    context '_' do
      let(:problem_name) { 'square_66_circle'}
      it { expect(subject.problem_name_snake_case).to eq 'square_six_six_circle' }
    end
  end

  describe 'problem_name_file_path' do
    it { expect(subject.problem_name_file_path).to eq Dir.pwd + '/app/problems/one_two_three_square_six_six_circle.rb'}
  end

  describe 'problem_name_spec_file_path' do
    it { expect(subject.problem_name_spec_file_path).to eq Dir.pwd + '/spec/problems/one_two_three_square_six_six_circle_spec.rb'}
  end

  describe 'module_content' do
    it 'builds ruby module file' do 
       expect(subject.module_content).to eq("" +
      "module Problems\n" +
      "  module OneTwoThreeSquareSixSixCircle\n" +
      "    module_function\n" +
      "\n" +
      "    def solve(*args)\n" +
      "    end\n" +
      "\n" +
      "  end\n" +
      "end" +
      "")
    end
  end

  describe 'spec_content' do
    xit 'builds ruby module file' do 
       expect(subject.spec_content).to eq("" +
        "require 'spec_helper'\n" +
        "\n" +
        "RSpec.describe Problems::OneTwoThreeSquareSixSixCircle do\n" +
        "\n" +
        "  let(:args) { [] }\n" +
        "  let(:subject) { described_class.solve(args) } \n" +
        "\n" +
        "  describe 'solve' do\n" +
        "\n" +
        "    xit 'TODO' do\n" +
        "    end\n" +
        "  end\n" +
        "end\n" +
      "")
    end
  end
end