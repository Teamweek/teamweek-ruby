module Teamweek
  module Api
    class Milestone
      include Teamweek::Api::HashConstructed
      attr_accessor :id
      attr_accessor :name
      attr_accessor :date
      attr_accessor :holliday
      attr_accessor :group_id


      def to_hash
        {
          id: id,
          name: name,
          date: date,
          holliday: holliday,
          group_id: group_id
        }
      end
    end
  end
end
