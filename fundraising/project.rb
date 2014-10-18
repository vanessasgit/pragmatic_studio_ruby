class Project
  attr_reader :funding, :target_amount
  attr_accessor :name
  def initialize(name, funding=0, target_amount)
    @name = name
    @funding = funding
    @target_amount = target_amount
    @received_pledge = Hash.new(0)
  end

  def add_funds
    @funding += 25
    "Project #{@name} got more funds!"
  end

  def remove_funds
    @funding -= 15
    puts "Project #{@name} has lost some funds!"
  end

  def to_s
    "Project #{@name} has #{@funding} in funding towards a goal of #{@target_amount}."
  end

  def funding_needed
      @target_amount - @funding
  end

  def fully_funded?
    funding_needed <= 0
  end

  def received_pledge(pledge)
    @received_pledge[pledge.name] += pledge.amount
    puts "#{@name} received a #{pledge.name} pledge worth $#{pledge.amount}."
    puts "#{@name}'s pledges: #{@received_pledge}"
  end
  
  def pledges
    @received_pledge.values.reduce(0, :+)
  end
  
  def total_funds
    @funding + pledges
  end

end

if __FILE__ == $0
  project = Project.new("Project ABC", 1000, 5000)
  puts project.name
  puts project.funding
  project.remove_funds
  puts project.funding
  project.add_funds
  puts project.funding
end
