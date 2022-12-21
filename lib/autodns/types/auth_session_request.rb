require_relative '../types'
require 'nokogiri'
require 'time'

module Autodns
  module Types
    class AuthSessionRequest
      def initialize(user:, password:, context:, token: nil)
        @auth = Auth.new(user:, password:, context:, token:)
      end

      def to_xml
        builder = Nokogiri::XML::Builder.new do |x|
          x.request do
            @auth.xml_build(x)
            x.task { x.code '1321001' }
          end
        end
        builder.to_xml
      end
    end

    class AuthSessionResponse
      attr_reader :user, :hash, :valid_until, :status

      def initialize(**options)
        @user        = options[:user]
        @hash        = options[:hash]
        @valid_until = options[:valid_until]
        @status      = options[:status]
      end

      def self.parse(xml)
        doc = Nokogiri::XML(xml)
        new(
          hash: doc.xpath('//auth_session/hash').text,
          user: doc.xpath('//auth_session/user/user').text,
          valid_until: Time.parse(
            doc.xpath('//auth_session/valid_until').text,
          ),
          status: Status.parse(
            doc.xpath('//auth_session'),
          ),
        )
      end
    end
  end
end
