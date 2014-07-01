module Teamweek
  module Api
    class Task
      include Teamweek::Api::HashConstructed
      attr_accessor :id
      attr_accessor :project_id
      attr_accessor :user_id
      attr_accessor :foreign_id
      attr_accessor :name
      attr_accessor :end_date
      attr_accessor :start_date
      attr_accessor :color
      attr_accessor :done

      def to_hash
        {
          id: id,
          name: name,
          color: color,
          start_date: start_date,
          end_date: end_date,
          project_id: project_id,
          user_id: user_id,
          done: done
        }
      end
    end
  end
end