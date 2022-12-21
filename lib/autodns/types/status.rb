module Autodns
  module Types
    class Status
      attr_accessor :code, :text, :type, :object


      def initialize(**options)
        @code   = options[:code]
        @text   = options[:text]
        @type   = options[:type]
        @object = options[:object]
      end

      def self.parse(xml)
        new(
          code: xml.xpath('//status/code').text,
          type: xml.xpath('//status/type').text,
          text: xml.xpath('//status/text').text,
        )
      end
    end
  end
end
