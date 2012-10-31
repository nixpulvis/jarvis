module Jarhead
  module System

    def system!( cmd, path = "/dev/null" )
      system "#{cmd} > #{path} 2>&1"
      return File.open(path, "r").read
    end

  end
end