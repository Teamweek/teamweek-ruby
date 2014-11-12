require 'httparty'

module Teamweek
  module Api
    module Test
      class HttpClient
        attr_reader :headers

        def initialize(headers = {})
          @headers = headers
        end

        def get(uri, parameters = {})
          request = HTTParty.get(uri, headers: headers, query: parameters)
          request.parsed_response
        end

        def post(uri, parameters = {})
          request = HTTParty.post(uri, headers: headers, body: parameters)
          request.parsed_response
        end

        def patch(uri, parameters = {})
          request = HTTParty.patch(uri, headers: headers, body: parameters)
          request.parsed_response
        end

        def put(uri, parameters = {})
          request = HTTParty.put(uri, headers: headers, body: parameters)
          request.parsed_response
        end

        def delete(uri, parameters = {})
          request = HTTParty.delete(uri, headers: headers, body: parameters)
          request.parsed_response
        end
      end
    end
  end
end