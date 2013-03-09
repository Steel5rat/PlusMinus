require './AI'
require './play.rb'
require './field.rb'

field=Field.new(3)
field.drawField
player=Player.new field
ai = AI.new field
turn = true
until field.victory? || field.notFreeSpace?
   if turn
     puts "You turn"
     player.turn
     turn=!turn
   else
     puts "AI turn"
     if !ai.turn
       puts "ACHTUNG!!!"
     end
     turn = !turn
   end
   field.drawField
end

if field.victory?
  puts "AI win" if turn
  puts "You win" if !turn
else
  puts "Draw"
end