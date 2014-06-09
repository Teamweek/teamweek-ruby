require "teamweek/api/hash_constructed"
module Teamweek
  module Api
    class User
      include HashConstructed
      attr_accessor :id
      attr_accessor :name
      attr_accessor :email
      attr_accessor :dummy
      attr_accessor :initials
      attr_accessor :color
      attr_accessor :foreign_id
    end
  end
end