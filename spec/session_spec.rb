require 'spec_helper'

describe 'Session' do
  # before do
  #   @session = RPS:Session.new
  # end
  it "has an unique id" do
  RPS::Session.class_variable_set :@@counter, 0
  expect(RPS::Session.new.key).to eq(1)
  end
end
