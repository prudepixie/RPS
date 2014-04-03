module RPS

  class SignIn < UseCase
    def run(inputs)


      # inputs = { :name => "Wendy", :pw => "123" }
      user = RPS.db.get_user_from_username(inputs[:username])
      return failure(:username_missing) if user == nil
      password = inputs[:pw]
      return failure(:incorrect_password) if user.password != password

      session = RPS.db.create_session(user.id)

      success :session_id => session.key, :user => user

    end

  end
end

