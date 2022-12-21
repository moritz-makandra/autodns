require_relative 'spec_helper'
require 'autodns/types'

describe Autodns::Types::AuthSessionRequest do

  request = Autodns::Types::AuthSessionRequest.new(user: 'customer', password: 'test', context: '4')

  describe request do
    it 'matches the sample xml' do
      expect(request.to_xml).to eq(File.read('spec/types/auth_session_create_request.xml'))
    end
  end

  req_with_token = Autodns::Types::AuthSessionRequest.new(user: 'customer', password: 'test', context: '4',
                                                              token: 123_123
  )

  describe req_with_token do
    it 'matches the sample xml' do
      expect(req_with_token.to_xml).to eq(File.read('spec/types/auth_session_create_request_with_token.xml'))
    end
  end
end

describe Autodns::Types::AuthSessionResponse do
  auth_response = Autodns::Types::AuthSessionResponse.parse(
    File.read('spec/types/auth_session_create_response.xml'),
  )

  describe auth_response do
    it 'has attribute hash' do
      expect(auth_response.hash).to eq('9b4b36ff-2bed-41c8-8471-6ede5d2873dd')
      expect(auth_response.user).to eq('customer')
    end

    it 'parses valid_until to date' do
      expect(auth_response.valid_until.year).to eq(2015)
    end

    it 'has status object' do
      expect(auth_response.status.class).to eq(Autodns::Types::Status)
    end

    it 'status has attributes' do
      expect(auth_response.status.code).to eq('S1321001')
      expect(auth_response.status.type).to eq('success')
    end
  end
end
