# module RPS
#   class ListInvites <UseCase
#     def run(inputs)
#       @db = RPS.db
#       session = @db.get_session(inputs[:key])
#       return failure(:session_not_found) if session ==nil

#       user_id = @db.get_user_from_session(inputs[:key])
#       invite = @db.invites.values.select{|x| }
#       return failure(:invite_missing)
#     end
#   end
# end

