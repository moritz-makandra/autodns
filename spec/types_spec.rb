require_relative 'spec_helper'
require 'autodns/types'
require 'nokogiri'

describe Autodns::Types::Status do
  status = Autodns::Types::Status.parse(
    Nokogiri::XML(File.read('spec/types/status.xml')),
  )
  describe status do
    it 'prases xml' do
      expect(status.code).to eq('S1321001')
      expect(status.type).to eq('success')
      expect(status.text).to eq('Die Benachrichtigung wurde erfolgreich abgerufen.')
    end
  end
end
