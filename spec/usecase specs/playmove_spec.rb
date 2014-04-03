describe RPS::PlayMove do
  before do
    @db = RPS.db
    @wendy = @db.add_user("wendy", "5678")
    @andy = @db.add_user("andy", "5432")
    @session = @db.create_session(@wendy.id)
    @session2 = @db.create_session(@andy.id)
    @match = @db.create_match(@wendy.id, @andy.id)
  end
  it "errors if session is not found" do
    result = RPS::PlayMove.run(:session_key => 1234)
    expect(result.error?).to eq(true)
    expect(result.error).to eq(:missing_session)
  end
  it "errors if move is not valid" do
    result = RPS::PlayMove.run(:session_key=>@session.key, :move=>"gun")
    expect(result.error).to eq(:move_not_valid)
  end
  it "passes if player move is valid" do
    result = RPS::PlayMove.run(:session_key=>@session.key, :move=>"rock", :match_id => @match.id)

    expect(result.success?).to eq(true)
  end
end
