
module RPS


  class AcceptInvite < UseCase
   def run(inputs)

      # binding.pry
      @db = RPS.db
      session = @db.get_session(inputs[:session_key])
      return failure(:missing_session) if session.nil?

      invite = @db.get_invite(inputs[:invite_id])
      return failure(:missing_invite) if invite.nil?

      user = @db.get_user_from_session(inputs[:session_key])

      return failure(:user_not_invited) if invite.invited_id != user.id

      match = @db.create_match(invite.inviter_id, invite.invited_id)

      success :match => match

    end
  end
end


# result = RPS::AcceptInvite.run({:invite_id => "invite.id" })

# result.invite
