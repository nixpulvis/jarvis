require 'tempfile'

module Jarhead
  module System

    def system!( cmd, path = "/dev/null" )
      stdout = Tempfile.new('STDOUT')
      system "#{cmd} > #{stdout.path} 2>&1"
      return File.open(stdout.path, "r").read
    end

  end
end