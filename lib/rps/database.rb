
require 'singleton'

module RPS

  def self.db
    @__db_instance ||= DB.new
  end

  class DB

    attr_reader :users, :rounds, :matches

    def initialize
      @users = {}
      @rounds = {}
      @matches = {}

    end
    # USER CRUD - CREATE #
    def add_user(name)
      user1 = RPS::User.new(name)
      user1_id = user1.id.to_i
      @users[user1_id.to_i] = user1
      return user1
    end

    #USER CRUD - READ #
    def show_users
      @users
    end


end
end
