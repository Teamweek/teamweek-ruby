require "teamweek/api/hash_constructed"
module Teamweek
  module Api
    class Project
      include Teamweek::Api::HashConstructed
      attr_accessor :id
      attr_accessor :name
      attr_accessor :color
      attr_accessor :foreign_id


      def to_hash
        {
          id: id,
          name: name,
          color: color
        }
      end
    end
  end
end