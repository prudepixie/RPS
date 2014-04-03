class RPS::Session

  attr_accessor :key, :user_id
  @@counter = 0
  def initialize(user_id)
    @@counter +=1
    @key= @@counter
    @user_id = user_id
  end
end


#need to associate with a username
