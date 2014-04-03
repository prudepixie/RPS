module RPS

  class SignIn < UseCase
    def run(inputs)


      # inputs = { :name => "Wendy", :pw => "123" }
      user = RPS.db.get_user_from_username(inputs[:username])
      return failure(:username_missing) if user == nil
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
