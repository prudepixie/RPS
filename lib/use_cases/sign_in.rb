module RPS

  class SignIn < UseCase
    def run(inputs)


      # inputs = { :name => "Wendy", :pw => "123" }

      username = inputs[:name]
      return failure(:username_missing) if user.name == nil
      password = inputs[:pw]
      return failure(:incorrect_password) if user.password != inputs[:pw]



      session = RPS.db.create_session(user.id)

      return success(:session_id => session.id, :user => username)

    end

  end
end

#inputs {:name =>"Beca"}
#in case of failure
#result = RPS::SignIn.run ({ :name => "Wendy" })
#result = failure(:username_missing )
