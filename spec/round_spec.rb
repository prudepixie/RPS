require 'spec_helper'

describe 'Round' do
  before do
    @round = RPS::Round.new
    @player1= RPS::User.new("wendy")
    @player2= RPS::User.new("andy")
    @match = RPS::Match.new(1,2)
  end

  it "makes a new round with unique id" do
    RPS::Round.class_variable_set :@@counter, 0
    expect(RPS::Round.new.id).to eq(1)
  end

  it "records player 1 and player 2 id " do
    @round.register_player1(1)
    @round.register_player2(2)

    expect(@round.player1_id).to eq(1)
    expect(@round.player2_id).to eq(2)
  end

  it"is attached with a match id" do
    @round.register_match(@match.id)
    expect(@round.mid).to eq(@match.id)
  end

  it "determines the winner of the round by p1 and p2 moves" do
    @round.register_player1(1)
    @round.register_player2(2)

    @round.determine_winner("rock", "paper")
    expect(@round.winner).to eq(2)

    @round.determine_winner("scissors", "rock")
    expect(@round.winner).to eq(2)

    @round.determine_winner("scissors", "paper")
    expect(@round.winner).to eq(1)

    @round.determine_winner("paper", "paper")
    expect(@round.winner).to eq(nil)
  end
end
