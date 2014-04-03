
describe RPS::CreateInvite do
  before do
    @db = RPS.db
    @wendy = @db.add_user("wendy", "5678")
    @andy = @db.add_user("andy", "5432")
    @session = @db.create_session(@wendy.id)
  end
  it "errors if session is not found" do
    # binding.pry
    result = RPS::CreateInvite.run(:session_key => 1234)
    expect(result.error?).to eq(true)
    expect(result.error).to eq(:missing_session)
  end
  it "errors, if user does not exist"do

  result = RPS::CreateInvite.run(:session_key =>@session.key, :invitee_id => "123")
  expect(result.error).to eq(:user_missing)
  end

  it "passes and creates an invite"do
  result = RPS::CreateInvite.run(:session_key =>@session.key, :invitee_id => @wendy.id)
  expect(result.success?).to eq(true)
  end
end
