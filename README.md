Tool for generating and organizing leetcode problems locally

## How to use

```
rake generate\[name-of-problem\] 
Created:
./leetcode/app/problems/name_of_problem.rb
./leetcode/spec/problems/name_of_problem_spec.rb
```
generated module
```ruby
=begin

CONSTRAINTS
------------------------------------------------------



IDEAS
------------------------------------------------------



=end

module Problems
  module NameOfProblem
    module_function

    def solve(*args)
    end
  end
end

```
generated test file

```ruby
require 'spec_helper'
require_problem('name_of_problem')

RSpec.describe Problems::NameOfProblem do
  let(:subject) { described_class.solve(*args) }

  describe 'solve' do
    context 'TODO' do
      let(:args) { 'TODO' }
      let(:result) { nil }
      
      xit { expect(subject).to eq result }
    end
  end
end

```

Note that added problems are gitignored. This is intentional.

## Why
I like working on leetcode problems using devtools like rspec, guard, and pry. This allows me to pull up a problem and quickly generate code and spec files for the problem, then use guard for TDD.