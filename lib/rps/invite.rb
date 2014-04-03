class RPS::Invite

  attr_accessor :id, :inviter_id, :invited_id, :status
  @@counter = 0
  def initialize
    @@counter+=1
    @id=@@counter
    @inviter_id = nil
    @invited_id = nil
    @status= "pending"
  end
end

