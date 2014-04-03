class RPS::User

  attr_accessor :name, :id, :password
  @@counter = 0
  def initialize(name, password)
    @name= name
    @@counter+=1
    @id=@@counter
    @password = password
  end
end

