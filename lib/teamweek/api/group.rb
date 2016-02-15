module Teamweek
  module Api
    class Group
      include Teamweek::Api::HashConstructed
      attr_accessor :id
      attr_accessor :name
      attr_accessor :account_id
      attr_accessor :memberships


      def to_hash
        {
          id: id,
          name: name,
          account_id: account_id,
          memberships: memberships
        }
      end
    end
  end
end
