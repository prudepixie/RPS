require 'spec_helper'

describe 'Round' do
  before do
    @round = RPS::Round.new
    @player1= RPS::User.new("wendy")
    @player2= RPS::User.new("andy")
  end

  it "makes a new round with unique id" do
    RPS::Round.class_variable_set :@@counter, 0
    expect(RPS::Round.new.id).to eq(1)
  end

  it "records player 1 and player 2 id " do
    @round.register_player1(@player1.id)
    @round.register_player2(@player2.id)

    expect(@round.player1_id).to eq(@player1.id)
    expect(@round.player2_id).to eq(@player2.id)
  end


end
