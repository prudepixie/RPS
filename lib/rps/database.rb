
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
      user = @users[original_id.to_i]
      user.name = new_name
      return user
    end
    #USER CRUD - DELETE #
    def delete_user(id)
      @users.delete(id.to_i)
      @users
    end

    #Match - Create#
    def start_new_match(p1_id, p2_id)
      match = RPS::Match.new(p1_id, p2_id)
      match_id = match.id.to_i
      @matches[match_id.to_i] = match
      return match
    end
    #Match - Read #
    def show_matches
      @matches
    end



    #ROUND CRUD - CREATE #
      #it shouldn't create if there is winner#
    def create_new_round_for_match(match_id)
      new_round = RPS::Round.new
      if new_round.winner ==3

        new_round.mid == match_id
        @rounds[new_round.id.to_i] = new_round
        return new_round
      end
    end
   #Round - Update#
    def determine_winner_in_round(round_id)

    end
    #ROUND CRUD - READ #
    def show_rounds(p1_id, p2_id)
    end




end
end
