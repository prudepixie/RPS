
require 'singleton'

module RPS

  def self.db
    @__db_instance ||= DB.new
  end

  class DB

    attr_reader :users, :rounds, :matches, :session

    def initialize
      @users = {}
      @rounds = {}
      @matches = {}
      @session = {}

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

    def get_user
      @users.values
    end
    def get_round
      @rounds.values
    end
    def get_matches
      @matches.values
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
      new_round = RPS::Round.new(match_id)
      # if new_round.winner

        new_round.mid == match_id
        @rounds[new_round.id.to_i] = new_round
        return new_round

    end
   #Round - Update#
    def determine_winner_in_round(match_id, p1_move, p2_move)
      round = RPS::Round.new(match_id)
      match = @matches[match_id.to_i]
      if p1_move == "rock" && p2_move == "paper"
        round.winner = match.player2_id
      elsif p1_move == "rock" && p2_move =="scissors"
        round.winner = match.player1_id
      elsif p1_move == "paper" && p2_move == "rock"
        round.winner = match.player1_id
      elsif p1_move == "paper" && p2_move == "scissors"
        round.winner = match.player2_id
      elsif p1_move == "scissors" && p2_move == "rock"
        round.winner = match.player2_id
      elsif p1_move == "scissors" && p2_move == "paper"
        round.winner = match.player1_id
      elsif p1_move == p2_move
        round.winner = nil
      end
      round.winner
    end

    #ROUND CRUD - READ #
    def show_rounds_for_each_match(mid)
      rounds = @rounds.values.select {|x| x.include?(x.mid)}
      return rounds.values
    end




end
end
