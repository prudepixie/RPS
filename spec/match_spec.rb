require 'spec_helper'

describe 'Match' do
  before do
    @match = RPS::Match.new(1,2)
  end

  it "makes a new match with unique id" do
    RPS::Match.class_variable_set :@@counter, 0
    expect(RPS::Match.new(1,2).id).to eq(1)
  end

end
