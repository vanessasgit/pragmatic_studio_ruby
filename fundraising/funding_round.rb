require_relative 'project'
require_relative 'die'

module FundingRound
  def self.round(project)
    die = Die.new
    if die.roll.odd?
      project.add_funds
    else
      project.remove_funds
    end
    pledge = PledgePool.random
    project.received_pledge(pledge)
  end
end