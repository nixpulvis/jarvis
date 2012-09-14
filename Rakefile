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

require "rocco/tasks"

# Build the docs with:
#
#     rake rocco
#
desc "Build Rocco Docs"
Rocco::make 'doc/', ['lib/**/*.rb', 'bin/*', 'Rakefile']

# Open the docs in your browser
#
#     rake rocco:open
#
namespace :rocco do
  desc "Open rocco docs in browser"
  task :open => [:rocco] do
    link = 'doc/lib/aide.html'

    if RUBY_PLATFORM.downcase.include?("darwin")
      `open #{link}`
    elsif RUBY_PLATFORM.downcase.include?("mswin")
      `start #{link}`
    else
      puts "Can't launch web browser on this platform."
    end
  end
end

# Check code quality
#
#     rake cane
#
require "cane/rake_task"
desc "Run code quality checks"
Cane::RakeTask.new(:quality) do |cane|
  cane.abc_max = 10
  cane.doc_glob = 'lib/**/*.rb'
end

# By default we’ll build the docs then build and install the gem.
#
#     rake
#
desc "Default"
task :default => [:quality, :rocco, :install]