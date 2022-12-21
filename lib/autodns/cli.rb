require 'thor'
require 'autodns/subcommands/zone'

module Autodns
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    class_option :debug, type: :boolean, default: false

    desc 'login', 'create session'
    option :username, aliases: '-u', type: :string
    option :password, aliases: '-p', type: :string
    option :context, aliases: '-c', type: :numeric
    option :token, aliases: '-t', type: :numeric
    def login
      puts "Login with #{options['username']}"
      puts options
    end

    desc 'logout', 'End session'
    def logout
      puts options
    end

    desc 'record {add|delete}', 'Add or delete a new DNS Record'

    option :zone,  aliases: '-z', descr: 'target zone to modify'
    option :type,  aliases: '-t', descr: 'record type, i.e. A, CNAME, etc'
    option :name,  banner: 'TEXT'
    option :value, banner: 'TEXT'

    def record(_action)
      puts options
    end

    desc 'zone {list|get}', 'Show information about zones'
    subcommand 'zone', Subcommands::Zone
  end
end
