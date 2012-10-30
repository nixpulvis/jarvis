module Jarhead

  class Compiler
    attr_reader :source_path

    def initialize( path = ["src"] )
      @source_path = path
    end

    def compile
      system "javac " + files.join(" ")
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