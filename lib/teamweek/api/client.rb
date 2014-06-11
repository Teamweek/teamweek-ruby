module Teamweek
  module Api
    class Client
      include HTTParty
      include Api::ResponseHandler
      format :json
      # Initializes the Teamweek API shared client with information
      # required to communicate with Teamweek
      #
      # @param access_token: string, the Teamweek access token
      # @param account_id: integer, account id in Teamweek
      def initialize(account_id, access_token, opts = {})
        base_uri = opts[:base_uri] || "https://teamweek.com"
        self.class.base_uri "#{base_uri}/api/v3/#{account_id}/"
        self.class.headers.merge!("Authorization" => "Bearer #{access_token}")
      end

      # Posts users to Teamweek bulk_import url.
      #
      # @param users: an array of users data as hash.
      # @return [Teamweek::Api::User] the added or found Teamweek user instances
      def import_users(users)
        params = { body: { users: users } }
        request = self.class.post '/users/bulk_import.json', params
        handle_response(request, Teamweek::Api::User)
      end
    end
  end
end