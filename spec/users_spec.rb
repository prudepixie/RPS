require 'spec_helper'

describe 'User' do
  before do
    @user = RPS::User.new("wendy")
  end

  it "makes a new user" do
    expect(@user.name).to eq("wendy")
  end
  it "generates unique id for each user" do
    RPS::User.class_variable_set :@@counter, 0
    expect(RPS::User.new("bob").id).to eq(1)
  end
end
