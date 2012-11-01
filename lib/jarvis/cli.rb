require 'jarvis'

module Jarvis
  class CLI

    private
      attr_accessor :flags

    # Sexy Options #
    ################

    def self.parse_flags
      ARGV.each_with_index do |arg, i|
        if arg[0] == "-"
          begin
            @flags[arg[1..-1]].call
          rescue NoMethodError
            puts "#{arg} is not a valid flag".red
            exit
          end
          ARGV.delete arg
        end
      end
    end

    # Sexy and Simple Command Parsing #
    ###################################

    def self.parse_commands
      ARGV[0] ||= "help"
      command = ARGV[0].to_sym
      if instance_methods(false).include? command
        begin
          self.new.public_send command, *ARGV.drop(1)
        rescue ArgumentError => e
          puts "#{ARGV[0]}: #{e.message}".red
        rescue NoMethodError => e
          puts "jarvis: #{ARGV[0]} is not a command.".red
        end
      end
    end

    def self.start
      parse_flags
      parse_commands
    end

  end
end