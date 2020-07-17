Tool for generating and organizing leetcode problems locally

## How to use

```
rake generate\[name-of-problem\] 
Created:
./leetcode/app/problems/name_of_problem.rb
./leetcode/spec/problems/name_of_problem_spec.rb
```
Note that added problems are gitignored. This is intentional.

## Why
I like working on leetcode problems using devtools like rspec, guard, and pry. This allows me to pull up a problem and quickly generate code and spec files for the problem, then use guard for TDD.