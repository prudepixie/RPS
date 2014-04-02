class RPS::Session

  attr_accessor :key, :user_id
  @@counter = 0
  def initialize
    @key= @@counter+=1
    @user_id = user_id
  end
end


#need to associate with a username
