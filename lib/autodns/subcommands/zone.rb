module Autodns
  module Subcommands
    class Zone < Thor
      desc 'list', 'Get all existing zones'
      def list
        puts 'list all zones'
      end

      desc 'get $ZONE_NAME', 'Show zone information'
      def get(zone_name)
        puts "getting zone: #{zone_name}"
      end

      desc 'backup', 'Take a backup a zones'

      option 'all', type: 'boolean', default: false
      def backup(*args)
        puts args
        puts options
      end

      desc 'restore', 'Restore a zone from backup'
      def restore(zone_name); end
    end
  end
end
