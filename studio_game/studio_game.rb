require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
    
knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(2)
knuckleheads.print_stats

chipmunks = Game.new("Chipmunks")
player4 = Player.new("Alvin", 70)
player5 = Player.new("Simon", 80)
player6 = Player.new("Theodore", 90)
chipmunks.add_player(player3)
chipmunks.add_player(player4)
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.play(2)
chipmunks.print_stats
