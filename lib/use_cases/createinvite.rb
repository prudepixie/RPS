module RPS
  class CreateInvite  < UseCase
    def run(inputs)
      @db = RPS.db
      session = @db.get_session(inputs[:session_key])
      return failure(:missing_session) if session.nil?



    end
  end
end
