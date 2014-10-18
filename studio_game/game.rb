require_relative 'player' 
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game

  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "\nThere are #{@players.size} in #{@title}:"
    
    @players.each do |player|
      puts player
    end
    
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |t|
      puts "A #{t.name} is worth #{t.points}"
    end

    1.upto(rounds) do |number|
      puts "\nRound #{number}"
      @players.each do |player| 
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_stats
    strong_players, wimpy_players = @players.partition{|n| n.strong?}
    
    puts "\n#{@title} Statistics"
    puts "\n#{strong_players.length} players:"
    strong_players.each do |player|
        print_name_and_health(player)
    end

    puts "\n#{wimpy_players.length} players:"
    wimpy_players.each do |player|
        print_name_and_health(player)
    end

    puts "\n#{@title}s High Scores:"
    @players.sort.each do |player|
      formatted_name = player.name.ljust(20, '.')
      puts "#{formatted_name} #{player.score}"
    end
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end
    puts "\n #{total_points} total points from treasures found"
  end
  def print_name_and_health(player)
     puts  "#{player.name} (#{player.health})"
  end

  def total_points
    @players.reduce(0){ |sum, player| sum + player.points}
  end
end

if __FILE__ == $0
  game1 = Game.new("Healthy Nuts")
  puts game1.title
  puts game1.play(10)
end