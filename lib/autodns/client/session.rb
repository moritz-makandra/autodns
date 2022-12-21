module Autodns
  module Client
    #
    # Autodns Api Session
    #
    # Create a session for authenticating against the api. This is the only way to log in with a one time token.
    #
    class Session
      def initialize(user:, password:, context:, token: nil)
        @user = user
        @password = password
        @context = context
        @token = token
      end

      def create
      end

      def delete
      end
    end
  end
end
