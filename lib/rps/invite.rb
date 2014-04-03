class RPS::Invite

  attr_accessor :id, :inviter_id, :invited_id, :status
  @@counter = 0
  def initialize(inviter_id, invited_id)
    @@counter+=1
    @id=@@counter
    @inviter_id = inviter_id
    @invited_id = invited_id
    @status= "pending"
  end
end

