
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

    #USER CRUD- UPDATE #
    def update_user(original_id, new_name)
      new_user = RPS::User.new(new_name)
      new_user_name = new_user.name
      @users[original_id.to_i] = new_user_name
      return new_user
    end
    #USER CRUD - DELETE #
    def delete_user(id)
      @users.delete(id.to_i)
      @users
    end

    #Match - Create#
    def start_new_match
      match = RPS::Match.new
      match_id = match.id.to_i
      @matches[match_id.to_i] = match
      return match
    end
    #Match - Read #
    def show_matches
      @matches
    end

    #Round - Update#
    def determine_winner_in_round(round_id)
    end

    #ROUND CRUD - CREATE #
      #it shouldn't create if there is winner#
    def create_new_round_for_match(match_id)
      new_round = RPS::Round.new
      if new_round.mid == match_id
        @rounds[new_round.id.to_i] = new_round
        return new_round
      end
    end

    #ROUND CRUD - READ #
    def show_rounds(p1_id, p2_id)
    end




end
end
