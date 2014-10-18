require_relative 'player'
require_relative 'die'

module  GameTurn
  def self.take_turn(player)
    numbered_rolled = Die.new
    case numbered_rolled.roll
    when 1..2
      player.blam
    when 3..4
      puts "#{player.name} was skipped"
    else
      player.w00t
    end
    t = TreasureTrove.random
    player.found_treasure(t)
  end
end