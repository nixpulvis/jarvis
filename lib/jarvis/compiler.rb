require 'jarvis/system'

module Jarvis

  class Compiler
    include System

    attr_reader :source_path, :class_path

    # Initialize a new Compiler to handle compiling and
    # running java classes.
    #
    # source_path is an array of paths to compile from source.
    # class_path is a path for the .class files to be stored.
    #
    def initialize( source_path = ["src"], class_path = "bin" )
      raise "Jarhead requires Java 1.6 or greater" unless java?
      @source_path = source_path
      @class_path  = class_path
    end

    # Compiles all files in @source_path into @class_path
    #
    # returns true if compilation was a success.
    # returns false and prints errors if compilation fails.
    #
    def compile
      output = system! "javac -d #{@class_path} " + files(@source_path).join(' ')
      if $?.success?
        return true
      else
        puts "---------- Compilation Errors ----------\n".red
        puts output.red
        puts "----------------------------------------".red
        return false
      end
    end

    # Runs the given class in an environment with all
    # classes in the @class_path
    #
    # prints all output of the java application.
    #
    def run( klass )
      output = system! "java -cp #{@class_path} #{klass}"
      puts "------------- Java Runtime -------------\n".yellow
      puts output.yellow
      puts "----------------------------------------".yellow
      return $?.success?
    end

    private

    # Return an array of file paths from project, that we want to
    # compile in the given path.
    #
    def files( paths )
      results = []
      paths.each do |dir|
        Dir.foreach(dir) do |file|
          next unless file =~ /.java/
          results << File.join(dir, file)
        end
      end
      return results
    end

  end

end