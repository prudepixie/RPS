

describe RPS::AcceptInvite do
  before do
    @db = RPS.db
    @wendy = @db.add_user("wendy", "5678")
    @andy = @db.add_user("andy", "5432")
    @session = @db.create_session(@wendy.id)
    @invite = @db.add_invite(@andy.id, @wendy.id)
  end
  it "errors if session is not found" do
    # binding.pry
    result = RPS::AcceptInvite.run(:session_key => 1234)
    expect(result.error?).to eq(true)
    expect(result.error).to eq(:missing_session)
  end

  it "errors, if user invite cannot be found" do
    result = RPS::AcceptInvite.run(:session_key => @session.key, :invite_id => "1234")

    expect(result.error).to eq(:missing_invite)
  end

  it "errors, if user fails be to invited" do
    wrong_invite = @db.add_invite(@andy.id, @andy.id)
    result = RPS::AcceptInvite.run(:session_key => @session.key, :invite_id => wrong_invite.id)
    expect(result.error).to eq(:user_not_invited)
  end

  it "passes and creates a new match" do

    result = RPS::AcceptInvite.run(:session_key =>@session.key, :invite_id => @invite.id)
    expect(result.success?).to eq(true)
    match = result.match
    expect(match.player1_id).to eq(@andy.id)

  end

end




