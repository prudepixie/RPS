class RPS::Round

  attr_accessor :id, :player1_id, :player2_id, :winner, :p1_move, :p2_move, :mid, :status
  @@counter = 0

  def initialize(mid)
    @@counter +=1
    @id = @@counter
    @player1_id = player1_id
    @player2_id = player2_id
    @winner = winner
    @p1_move = p1_move
    @p2_move = p2_move
    @mid = mid
    @status = "pending"
  end

  def register_player1(player1_id)
    @player1_id = player1_id
  end

  def register_player2(player2_id)
    @player2_id = player2_id
  end

  # def register_match(mid)
  #   @mid=mid
  # end

  # def determine_winner(p1_move, p2_move)
  #   if p1_move == "rock" && p2_move == "paper"
  #     @winner = @player2_id
  #   elsif p1_move == "rock" && p2_move =="scissors"
  #     @winner = @player1_id
  #   elsif p1_move == "paper" && p2_move == "rock"
  #     @winner = @player1_id
  #   elsif p1_move == "paper" && p2_move == "scissors"
  #     @winner = @player2_id
  #   elsif p1_move == "scissors" && p2_move == "rock"
  #     @winner = @player2_id
  #   elsif p1_move == "scissors" && p2_move == "paper"
  #     @winner = @player1_id
  #   elsif p1_move == p2_move
  #     @winner = nil
  #   end
  # end


end
