class RPS::Match

  attr_accessor :id, :winner, :player2_id, :player1_id
  @@counter = 0

  def initialize(player1_id, player2_id)
    @id = @@counter+=1
    @winner = nil
    @player1_id = player1_id
    @player2_id = player2_id


  end

end


