require 'net/http'
module Teamweek
  module Api
    module ResponseHandler

      def handle_response(request, entity)
        if success?(request.response)
          request.parsed_response.map { |h| entity.new(h) }
        else
          handle_error(request.response)
        end
      end

      def handle_error(response)
        if response.kind_of? Net::HTTPUnauthorized
          raise Teamweek::Api::AccessDeniedError
        else
          raise Teamweek::Api::InvalidRequestError
        end
      end

      def success?(response)
        response.kind_of? Net::HTTPSuccess
      end
    end
  end
end