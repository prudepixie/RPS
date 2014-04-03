module RPS
  class CreateInvite  < UseCase
    def run(inputs)
      @db = RPS.db
      session = @db.get_session(inputs[:session_key])
      return failure(:missing_session) if session.nil?

      invitee = @db.get_user(inputs[:invitee_id])
      return failure(:user_missing) if invitee.nil?
      inviter_id = @db.get_user_from_session(inputs[:session_key])

      invite = @db.add_invite(inviter_id, invitee.id)

      success :invite =>invite


    end
  end
end
