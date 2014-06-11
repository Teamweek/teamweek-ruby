module Teamweek
  module Api
    class ApiError < StandardError
      attr_reader :code
      attr_reader :message

      def initialize(code, message)
        @code = code.to_sym
        @message = message
      end

      def to_json
        JSON.generate({error: @code.to_s, error_description: @message})
      end

    end

    class AccessDeniedError < ApiError
      def initialize
        super :access_denied, "You are now allowed to access Teamweek."
      end
    end

    class InvalidRequestError < ApiError
      def initialize
        super :invalid_request, "The Teamweek API request has wrong parameters."
      end
    end
  end
end