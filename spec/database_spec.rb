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
    expect(@db.add_user("wendy")).to be_a(RPS::User)
  end
  it "shows list of all users" do
    wendy = @db.add_user("wendy")
    andy = @db.add_user("andy")
    expect(@db.show_users).to eq({wendy.id=>wendy, andy.id=>andy})
  end
  it "changes an existing user's name (their id stays the same)" do
    wendy = @db.add_user("wendy")
    expect(@db.show_users).to eq({wendy.id =>wendy})

     freda = RPS::User.new("Freda")
     @db.update_user(wendy.id, "Freda")
     expect(@db.users).to eq({wendy.id => freda.name})
  end
  it "deletes a user" do
    wendy = @db.add_user("wendy")
    expect(@db.delete_user(wendy.id)).to eq({})
  end

  it "starts a new match" do
    expect(@db.start_new_match).to be_a(RPS::Match)
  end
  it "shows list of all matches" do
    match1 = @db.start_new_match
    match2 = @db.start_new_match

    expect(@db.show_matches).to eq({match1.id =>match1, match2.id => match2})
  end

  describe "new round" do
    before do
      @match1 = @db.start_new_match
      @round1 = @db.create_new_round_for_match(@match1.id)
    end
  it "creates a new round for specific match" do
    expect(@round1).to eq(@round1)

    # round2 = @db.create_new_round_for_match(@match.id)
   end
  it "determines winner for each round " do



   end
  end
end
