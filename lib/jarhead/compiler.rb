require 'tempfile'
require 'jarhead/system'

module Jarhead

  class Compiler
    include System

    attr_reader :source_path

    def initialize( source_path = ["src"], class_path = "src" )
      @source_path = source_path
      @class_path  = class_path
    end

    def compile
      stdout = Tempfile.new('STDOUT')
      output = system! "javac -d #{@class_path} " + files.join(" "), stdout.path
      if $?.success?
        return true
      else
        puts "---------- Compilation Errors ----------\n".red
        puts output.red
        puts "----------------------------------------".red
        return false
      end
    end

    def run( klass )
      stdout = Tempfile.new('STDOUT')
      output = system! "java -cp #{@class_path} #{klass}", stdout.path
      puts "------------- Java Runtime -------------\n".yellow
      puts output.yellow
      puts "----------------------------------------".yellow
      return $?.success?
    end

    def files
      result = []
      @source_path.each do |path|
        result << File.join(path, "*.java")
      end
      return result
    end

  end

end