#!/usr/bin/env rake

require "bundler/gem_tasks"

# Build the gem with:
#
#     rake build
#
# Build and Install the gem with:
#
#     rake install
#

# By default build and install the gem
task :default => :install

require 'rake/testtask'

# Test the gem with:
#
#     rake test
#

Rake::TestTask.new do |t|
  t.libs << 'test'
end