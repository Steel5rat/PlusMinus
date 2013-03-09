class Field   #arr, rank, xval, yval
  attr_reader :arr
  def initialize(numbOfElemInLine)
    @rank = numbOfElemInLine
    @arr = Array.new(@rank, [])
    for i in (0..@rank-1)          #пытаньнечка. як інакш?
      @arr[i]=Array.new(@rank, 'empty')
    end
  end

  def drawField
     puts "_"*4*@rank
     @arr.each do |line|
        print '|'
        line.each do |symb|
           if symb=='empty'
             print '   |'
           elsif symb=='X'
             print ' X |'
           elsif symb=='0'
             print ' 0 |'
           end
        end
        puts
        puts "_"*4*@rank
     end
  end

  def victory?
    @arr.each do |line|   #lines
      temp=line[0]
      count=0
      line.each do |symb|
        if (temp==symb)&&(temp!='empty')
          count+=1
        end
      end
      return true if count==@rank
    end

    for i in (0..@rank-1) do    #columns
      temp=@arr[0][i]
      count=0
      for j in (0..@rank-1) do
         if (temp==@arr[j][i])&&(temp!='empty')
           count+=1
         end
      end
      return true if count==@rank
    end

    temp=@arr[0][0]    #\
    count=0
    for i in (0..@rank-1) do
      if (temp==@arr[i][i])&&(temp!='empty')
        count+=1
      end
    end
    return true if count==@rank

    temp=@arr[0][@rank-1]    #/
    count=0
    for i in (0..@rank-1) do
      if (temp==@arr[i][@rank-1-i])&&(temp!='empty')
        count+=1
      end
    end
    return true if count==@rank
    false
  end

  def notFreeSpace?
    @arr.each do |line|
      line.each do |symb|
        if symb=='empty'
          return false
        end
      end
    end
    true
  end

  def setX valx
     if valx<=@rank
       @xval=valx
       return true
     end
    false
  end

  def setY valy
    if valy<=@rank
      @yval=valy
      return true
    end
    false
  end

  def addFigure type
    if(@arr[@yval][@xval]=='empty')
      @arr[@yval][@xval]=type
      true
    else
      false
    end
  end

end