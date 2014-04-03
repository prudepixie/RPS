module RPS
  class PlayMove < UseCase
    def run(inputs)
      @db = RPS.db
      session = @db.get_session(inputs[:session_key])
      return failure(:missing_session) if session.nil?
      return failure(:move_not_valid) if !(inputs[:move] == "rock" ||inputs[:move] == "scissors" || inputs[:move] == "paper")

      match = @db.get_match(inputs[:match_id])
      user_id = @db.get_user_from_session(inputs[:session_key])


      game = nil
      # return success if (inputs[:move] == "rock" ||inputs[:move] == "scissors" || inputs[:move] == "paper")
      success :game =>game, :match =>match
    end
  end
end
