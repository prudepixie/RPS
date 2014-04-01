require 'spec_helper'

describe 'Users' do
  before do
    @user = TM::User.new("wendy")
  end

  it "makes a new user" do
    expect(@user.name).to.eq("wendy")
end
