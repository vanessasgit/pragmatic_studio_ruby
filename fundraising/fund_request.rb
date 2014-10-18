require_relative 'project'
require_relative 'funding_round'
require_relative 'pledge'

class FundRequest
  
  attr_reader :title
  
  def initialize(title)
    @title = title
    @projects = []
  end
  
  def add_project(a_project)
    @projects.push(a_project)
  end
  
  def request_funding(round)
    puts "\nThere are #{@projects.size} projects that you could fund:"
    @projects.each do |project|
      puts project
    end

    pledge = PledgePool::PLEDGES
    puts "\nThere are #{pledge.size} possible pledge amounts:"
    pledge.each do |p|
      puts "A #{p.name} pledge is worth $#{p.amount}."
    end

    1.upto(round) do |number|
      puts "\nFunding Round #{number}:"
      @projects.each do |project|
        FundingRound.round(project)
      end
    end
  end

  def print_stats 
    fully_funded, need_funding = @projects.partition{|n| n.fully_funded?}
    puts "\nProjects that still need funding:"
    if need_funding.size > 0
      need_funding.each do |n|
          puts "#{n.name} needs $#{n.funding_needed}."
      end
    else
      puts "There are no projects that need funding"
    end

    puts "\nProjects that are fully funded:"
    if fully_funded.size > 0
      fully_funded.each do |n|
        puts "#{n.name}"
      end
   else
      puts "There are no projects that are fully funded"
    end

    sorted_projects = need_funding.sort {|a,b| b.funding_needed <=> a.funding_needed}
    puts "\nProjects that need the most funding"
    sorted_projects.each do |n| 
      puts "#{n.name} needs #{n.funding_needed}"
    end
  end
end