require 'spec_helper'

describe "Database" do
  before do
    @db = RPS.db
    @wendy= RPS::User.new("wendy")
  end
  it "exists" do
    expect(@db).should be_an_instance_of(RPS::DB)
  end

  it "adds a new user" do
    expect(@db.add_user("wendy")).to be_a(RPS::User)
end
  it "shows list of all users" do
    wendy= @db.add_user("wendy")
    expect(@db.show_users).to eq([wendy])
end
end
