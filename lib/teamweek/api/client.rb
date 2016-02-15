module Teamweek
  module Api
    class Client
      include Teamweek::Api::Importer
      include Teamweek::Api::Exporter
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

      # Get tasks to Teamweek get_resource url.
      #
      #@param tasks: a hash of options to filter
      #@return a collection of Teamweek::Api::Task
      def export_tasks(params={})
        get_resource('tasks', params, Teamweek::Api::Task)
      end

      # Get projects to Teamweek get_resource url.
      #
      #@param projects: api not support options
      #@return a collection of Teamweek::Api::Project
      def export_projects
        get_resource('tasks', nil, Teamweek::Api::Project)
      end

      # Get users to Teamweek get_resource url.
      #
      #@param users: api not support options
      #@return a collection of Teamweek::Api::User
      def export_users
        get_resource('users', nil, Teamweek::Api::User)
      end

      # Get milestones to Teamweek get_resource url.
      #
      #@param milestones: a hash of options to filter
      #@return a collection of Teamweek::Api::Milestone
      def export_milestones(params={})
        get_resource('milestones', params, Teamweek::Api::Milestone)
      end

      # Get groups to Teamweek get_resource url.
      #
      #@param groups: a hash of options to filter
      #@return a collection of Teamweek::Api::Milestone
      def export_groups
        get_resource('groups', nil, Teamweek::Api::Group)
      end

      private

      def set_base_uri(site, account_id)
        site ||= "https://teamweek.com"
        @base_uri = "#{site}/api/v3/#{account_id}"
      end

      def full_path(uri)
        base_uri + uri
      end
    end
  end
end
