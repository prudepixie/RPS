require 'spec_helper'

describe 'SignIn' do
  before do
    @db = RPS.db
    @user = @db.add_user("Wendy", "1234")
  end

  it "errors, if username doesn't exist " do
    result = RPS::SignIn.run(:name => "Tom", :pw => "1234")
    expect(result.error).to eq(:username_missing)
    expect(result.error?).to eq(true)
  end
end



