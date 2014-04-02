#input = gets..
#invite id comes from the user
#this exists in client
# result = RPS::AcceptInvite.run(:invite_id => id)

# if result.success?
#   match = result.match
#   # make this an ostruct
#   puts "Invite accepted! Match id is #{match.id}"
#   #comes from create a match


# else
#   if result.error == :missing_invite
#     puts "Invite does not exist."
#   end
# end

# describe MyApp::AcceptInvite do
#   before do
#     @db = MyApp::DB.new
# end

#   it "creates a match from p1 p2 id" do
#     p1 = @db.add_user("wendy")
#     p2 = @db.add_user("andy")
#     match = @db.start_new_match(p1.id, p2.id)

#     result = subject.run({ :invite_id => invite.id, :user_id => user.id})
#     expect(result.success?).to eq true
#     expect(result.match.player1.id).to eq(p1.id)
#   end
# end



