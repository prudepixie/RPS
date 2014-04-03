require 'spec_helper'

describe "Database" do
  before do
    @db = RPS.db
    # @wendy = RPS::User.new("wendy")
    # @match = RPS::Round.new
  end
  it "exists" do
    expect(@db).should be_an_instance_of(RPS::DB)
  end

  it "adds a new user" do
    wendy = @db.add_user("wendy", "1234")
    expect(wendy.name).to eq("wendy")
  end
  it "shows list of all users" do
    wendy = @db.add_user("wendy", "123")
    andy = @db.add_user("andy","123")
    expect(@db.show_users).to eq([wendy, andy])
  end
  it "gets user from their username" do
    wendy = @db.add_user("wendy", "1234")
    expect(@db.get_user_from_username("wendy")).to eq(wendy)
  end
  it "gets invite from thier invite id" do
    wendy = @db.add_user("wendy", "123")
    andy = @db.add_user("andy","123")
    invite = @db.add_invite(wendy.id, andy.id)
    expect(@db.get_invite(invite.id)).to eq(invite)
  end

  it "gets user from session key" do
    wendy = @db.add_user("wendy", "1234")
    session = @db.create_session(wendy.id)
    expect(@db.get_user_from_session(session.key).name).to eq("wendy")
  end
  it "creates a new session" do
     wendy = @db.add_user("wendy", "1234")
      session = @db.create_session(wendy.id)
    expect(session).to eq(session)
  end

  it "changes an existing user's name (their id stays the same)" do
    wendy = @db.add_user("wendy", "1234")
    expect(@db.show_users).to eq([wendy])

     @db.update_user(wendy.id, "Freda")
     expect(@db.users).to eq({wendy.id => wendy})
  end
  it "deletes a user" do
    wendy = @db.add_user("wendy", "1234")
    expect(@db.delete_user(wendy.id)).to eq({})
  end

  it "starts a new match initialized with 2 player ids" do

    match = @db.start_new_match(1, 5)

    expect(match).to be_a(RPS::Match)
    expect(match.player1_id).to eq(1)
    expect(match.player2_id).to eq(5)
  end
  it "shows list of all matches" do
    match1 = @db.start_new_match(3,4)
    match2 = @db.start_new_match(1,2)

    expect(@db.show_matches).to eq({match1.id =>match1, match2.id => match2})
  end

  describe "new round" do
    before do
      @player1= RPS::User.new("wendy", "1234")
      @player2 = RPS::User.new("andy", "1234")
      @match1 = @db.start_new_match(@player1.id,@player2.id)
      @round1 = @db.create_new_round_for_match(@match1.id)

    end
  it "creates a new round for specific match" do
    expect(@round1).to eq(@round1)
    # round2 = @db.create_new_round_for_match(@match.id)
  end

  it "determines winner for each round " do
    # player1 = @db.add_user("wendy", 1234)
    # player2 = @db.add_user("andy")
    winner= @db.determine_winner_in_round(@match1.id, "rock", "paper")
    expect(winner).to eq(@player2.id)
   end
   it " shows all the rounds for specific match " do

    round2 = @db.create_new_round_for_match(@match1.id)
    round3 = @db.create_new_round_for_match(99)
    expect(@db.show_rounds_for_each_match(@match1.id)).to eq([@round1, round2])


  end


  end
end
