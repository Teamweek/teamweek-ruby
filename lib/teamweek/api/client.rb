module Teamweek
  module Api
    class Client
      attr_accessor :client

      def initialize(client, account_id, opts={})
        @client = client
        base_uri = opts[:base_uri] || "https://teamweek.com"
        @client.base_uri("#{base_uri}/api/v3/#{account_id}")
      end

      # Posts users to Teamweek bulk_import url.
      #
      # @param users: an array of users data as hash.
      # @return [Teamweek::Api::User] the added or found Teamweek user instances
      def import_users(users)
        params = { body: { users: users } }
        request = client.post '/users/bulk_import.json', params
        request.parsed_response.map { |h| Teamweek::Api::User.new(h) }
      end

      # Posts projects to Teamweek bulk_import url.
      #
      # @param projects: an array of projects data as hash.
      # @return [Teamweek::Api::Project] the added or found Teamweek project instances
      def import_projects(projects)
        params = { body: { projects: projects } }
        request = client.post '/projects/bulk_import.json', params
        request.parsed_response.map { |h| Teamweek::Api::Project.new(h) }
      end
    end
  end
end