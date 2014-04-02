
module RPS



  class AcceptInvite < UseCase
   def run (inputs)
      invite = DB.get_invite(inputs [:invite_id])
      return failure(:missing_invite) if invite.nil?

      invite =
  #   #create a match
      RPS.db.start_new_match(invite.player1_id, invite.player2_id)
  #   #create a pending game

  #   #return the new match

      success :invite =>invite, :inviter =>invite.user_id, :match => match
    end

    # def create_match()
    # end
  end
end


result = RPS::AcceptInvite.run({:invite_id => "invite.id" })

result.invite
