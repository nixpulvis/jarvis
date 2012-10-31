require 'tempfile'
require 'jarhead/system'

module Jarhead

  class Compiler
    include System

    attr_reader :source_path

    def initialize( path = ["src"] )
      @source_path = path
    end

    def compile
      stdout = Tempfile.new('STDOUT')
      output = system! "javac " + files.join(" "), stdout.path
      if $?.success?
        return true
      else
        puts "---------- Compilation Errors ----------\n".magenta
        puts output.red
        puts "----------------------------------------".magenta
        return false
      end
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