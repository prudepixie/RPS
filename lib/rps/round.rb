class RPS::Round

  attr_accessor :id, :player1_id, :player2_id
  @@counter = 0

  def initialize
    @@counter +=1
    @id = @@counter
    @player1_id = nil
    @player2_id = nil
  end

  def register_player1(player1_id)
    @player1_id = player1_id
  end

  def register_player2(player2_id)
    @player2_id = player2_id
  end

end
