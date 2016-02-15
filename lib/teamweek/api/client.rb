module Teamweek
  module Api
    class Client
      include Teamweek::Api::Importer
      attr_accessor :client
      attr_accessor :base_uri

      def initialize(client, account_id, opts={})
        @client = client
        set_base_uri(opts[:base_uri], account_id)
      end

      # Posts users to Teamweek bulk_import url.
      #
      # @param users: an array of users data as hash.
      # @return [Teamweek::Api::User] the added or found Teamweek user instances
      def import_users(data)
        bulk_import('users', data, Teamweek::Api::User)
      end

      # Posts projects to Teamweek bulk_import url.
      #
      # @param projects: an array of projects data as hash.
      # @return [Teamweek::Api::Project] the added or found Teamweek project instances
      def import_projects(data)
        bulk_import('projects', data, Teamweek::Api::Project)
      end

      # Posts tasks to Teamweek bulk_import url.
      #
      # @param tasks: an array of tasks data as hash.
      # @return [Teamweek::Api::Task] the added or found Teamweek task instances
      def import_tasks(data)
        bulk_import('tasks', data, Teamweek::Api::Task)
      end

      def fetch_tasks(params={})
        response = client.get(task_path(params), params)
        response = response.map { |h| Teamweek::Api::Task.new(h) }
      end

      private

      def set_base_uri(site, account_id)
        site ||= "https://teamweek.com"
        @base_uri = "#{site}/api/v3/#{account_id}"
      end

       def full_path(uri)
         base_uri + uri
       end

       def task_path(params)
         filter_param = params[:filter]
         return full_path("/tasks/#{filter_param}?") if filter_param
         full_path('/tasks')
       end
    end
  end
end
