require_relative 'fund_request'

describe FundRequest do
  before do
    @initial_amount = 500
    @project = Project.new('craft_store', @initial_amount, 4500)
    @projects = FundRequest.new("Desperate")
    @projects.add_project(@project)
  end
  it "adds funds to an odd number die roll" do
      allow_any_instance_of(Die).to receive(:roll).and_return(1)

      @projects.request_funding(2)

      expect(@project.funding).to eq(@initial_amount + (25*2))
  end

  it "adds funds to an odd number die roll" do
    allow_any_instance_of(Die).to receive(:roll).and_return(2)

    @projects.request_funding(2)

    expect(@project.funding).to eq(@initial_amount - (15*2))
  end

end