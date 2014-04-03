
module RPS


  class AcceptInvite < UseCase
   def run (inputs)
      #inputs = { :id => "4", :inviterid=> "1", :inviteeid=> "2", :status=> "pending"}

      invite_id = inputs[:id]
      return failure(:missing_invite) if invite.nil?







      invite = DB.get_invite(inputs [:invite_id])

  #   #create a match
      RPS.db.start_new_match(invite.player1_id, invite.player2_id)
  #   #create a pending game

  #   #return the new match

      success :invite =>invite, :inviter =>invite.inviter_id, :invited => invite.invited_id, :invite_id => invite.id, :status => invite.status
    end

    def check_invite(id)
      invite = RPS.db.show_invites
      invite.find{|invite| invite.id ==id}
    # def create_match()
    # end
    end
  end
end


# result = RPS::AcceptInvite.run({:invite_id => "invite.id" })

# result.invite
