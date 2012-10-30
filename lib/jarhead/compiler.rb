module Jarhead

  class Compiler
    attr_reader :source_path

    # Creates a new java compiler to compile files in the
    # given path reletive to execution.
    def initalize( path = ["src"] )
      x = [] << x if x.is_a? String
      @source_path = path
    end

    def compile( args )
      files = to_compile(args).join(" ")
      system "javac #{files}"
    end

    def to_compile( args )
      result = []

      if args
        @source_path.each do |path|
          args[:only].each do |name|
            file = File.join(path, file)
            result << file if File.exists? file
          end
        end
        unless args[:only] == result.map { |e| File.basename e }
          raise "Missing file for compilation"
        end
      else
        @source_path.each do |path|
          result << File.join path, "*.java"
        end
      end

      return result
    end

  end

end

# compiler = Jarhead::Compiler.new "src"
# compiler.compile
# compiler.compile only: [FMap.java, FList.java]