module Autodns
  module Types
    class Auth
      def initialize(user:, password:, context:, token: nil)
        @user     = user
        @password = password
        @context  = context
        @token    = token
      end

      def xml_build(nokogiri_builder)
        nokogiri_builder.send('auth') do |xml|
          xml.user @user
          xml.password @password
          xml.context_ @context
          xml.token @token if @token
        end
      end
    end
  end
end
