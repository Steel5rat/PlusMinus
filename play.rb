class Player
  def initialize(field)
    @field = field
  end

  def turn
      until @field.setX(Integer(gets.chomp)-1)
        puts("Bad input")
      end
      until @field.setY(Integer(gets.chomp)-1)
        puts("Bad input")
      end
      if !@field.addFigure 'X'
        puts "Bad input"
        turn
      end
  end
end