class RPS::Match

  attr_accessor :id, :winner
  @@counter = 0

  def initialize
    @id = @@counter+=1
    @winner= nil

  end



end


