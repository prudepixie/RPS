module RPS


  class SignUp < UseCase
    def run(inputs)
      # inputs = { :name => "Wendy", :pw => "123" }

      username = inputs[:name]
      return failure(:name_taken) if check_name(username) != nil
      password = inputs[:pw]

      new_user = RPS.db.add_user(inputs[:name])

      return success(:user => new_user)

    end
    def check_name(name)
      users = RPS.db.show_users
      users.find { |user| user.name == name }
    end
  end
end

# # in the case of a failure
# result = RPS::SignUp.run({ :name => "Wendy", :pw => "123" })
# result = failure(:name_taken)
# result.error
# # => :name_taken

# # in the case of a success
# result = success(:user => new_user)
# result.user
# # => new_user

# module RPS

#   class UseCase
#     def self.run(inputs)
#       self.new.run(inputs)
#     end

#     def failure(error_sym)
#       UseCaseFailure.new(:error => error_sym)
#       # UseCaseFailure.new(:error => :name_taken)
#     end

#     def success(data={})
#       UseCaseSuccess.new(data)
#     end
#   end

#   class UseCaseFailure < OpenStruct
#     def success?
#       false
#     end
#     def error?
#       true
#     end
#   end

#   class UseCaseSuccess < OpenStruct
#     def success?
#       true
#     end
#     def error?
#       false
#     end
#   end
# end

