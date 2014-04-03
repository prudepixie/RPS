require 'spec_helper'

describe 'ListInvites' do
  before do
    @db = RPS.db
    @wendy = @db.add_user("wendy", "5678")
    @andy = @db.add_user("andy", "5432")
    @session = @db.create_session(@wendy.id)
    #wendy invites andy
  end

  it "errors, if session is not found" do
    result = RPS::ListInvites.run(:session_id => 3)
    expect(result.error).to eq(:session_not_found)
    expect(result.error?).to eq(true)
  end
end
