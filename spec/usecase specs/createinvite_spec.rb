
describe RPS::CreateInvite do
  before do
    @db = RPS.db
    @wendy = @db.add_user("wendy", "5678")
    @andy = @db.add_user("andy", "5432")
    @session = @db.create_session(@wendy.id)
    @invite = @db.add_invite(@wendy.id, @andy.id)
  end
  it "errors if session is not found" do
    # binding.pry
    result = RPS::AcceptInvite.run(:session_key => 1234)
    expect(result.error?).to eq(true)
    expect(result.error).to eq(:missing_session)
  end

end
