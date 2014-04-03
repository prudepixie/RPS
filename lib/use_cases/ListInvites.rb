module RPS
  class ListInvites <UseCase
    def run(inputs)
      @db = RPS.db
      session = @db.get_session(inputs[:key])
      return failure(:session_not_found) if session ==nil
    end
  end
end

