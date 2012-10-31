require 'tempfile'

module Jarvis
  module System

    def system!( cmd, path = "/dev/null" )
      stdout = Tempfile.new('STDOUT')
      system "#{cmd} > #{stdout.path} 2>&1"
      return File.open(stdout.path, "r").read
    end

    def java?
      system! "java -version" =~ /1.6/
    end

  end
end