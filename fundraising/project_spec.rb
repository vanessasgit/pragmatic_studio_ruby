require_relative 'project'

describe Project do

  before do
    @initial_amount = 500
     @project = Project.new('craft_store', @initial_amount, 4500)
  end
  it "has an initial target funding amount" do
   
    expect(@project.target_amount).to eq(4500)
  end
  it "computes the total funding outstanding" do

    expect(@project.funding_needed).to eq(4500 - 500)
  end

  it "increases funds by 25" do
    @project.add_funds

    expect(@project.funding).to eq(500 + 25)
  end
  it "decreases funds by 15" do
    @project.remove_funds

    expect(@project.funding).to eq(500 -15)
  end

  context "created without funding amount" do
      before do
       @project = Project.new('craft_store', 4500)
     end
    it "has default value of 0" do
      expect(@project.funding).to eq(0)
    end
  end

  context "project with where funding equals target funding" do
    before do
      @project = Project.new('craft_store', 4500, 4500)
    end

    it "project has reached or exceded its target amount" do
      expect(@project.funding).to be >= 4500
    end
  end
end