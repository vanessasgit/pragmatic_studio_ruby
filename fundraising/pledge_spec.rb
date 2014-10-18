require_relative 'pledge'

describe Pledge do
  before do
    @pledge = Pledge.new(:bronze, 50)
  end

  it "has a name attribute" do
    expect(@pledge.name).to eq(:bronze)
  end

  it "has a amount attribute" do
    expect(@pledge.amount).to eq(50)
  end
end

describe PledgePool do
  it "has 3 pledges" do
    expect(PledgePool::PLEDGES.size).to eq(3)
  end

  it "has bronze pledge worth $50" do
    expect(PledgePool::PLEDGES[0]).to eq(Pledge.new(:bronze, 50))
  end

  it "has a silver pledge worth $75" do
    expect(PledgePool::PLEDGES[1]).to eq(Pledge.new(:silver, 75))
  end

  it "has a gold pledge worth $100" do
    expect(PledgePool::PLEDGES[2]).to eq(Pledge.new(:gold, 100))
  end

  it "returns a random pledge" do
    pledge = PledgePool.random
    expect(PledgePool::PLEDGES).to include(pledge)
  end
end