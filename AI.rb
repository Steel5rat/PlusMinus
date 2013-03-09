class AI               #штучны інтылект
  def initialize field       #працуе з полем толькі 3х3. магчыма, з любой колькасьцю няцотных
    @field=Array.new(3)
    @field= field
    @arr=@field.arr
    @rank=@arr[0].count
  end

  def turn
    return true if tryGeneralRules
    return true if tryCenter
    return true if tryCorner
    return true if tryAnywhere
    false
  end

  def tryAnywhere
    for i in (0..@rank-1) do
      for j in (0..@rank-1) do
        if 'empty'==@arr[i][j]
          @field.setX j
          @field.setY i
          @field.addFigure '0'
          return true
        end
      end
    end
    false
  end

  def tryCorner
    if @arr[0][0]=='empty'
      @field.setX 0
      @field.setY 0
      @field.addFigure '0'
      return true
    end
    if @arr[0][@rank-1]=='empty'
      @field.setX @rank-1
      @field.setY 0
      @field.addFigure '0'
      return true
    end
    if @arr[@rank-1][0]=='empty'
      @field.setX 0
      @field.setY @rank-1
      @field.addFigure '0'
      return true
    end
    if @arr[@rank-1][@rank-1]=='empty'
      @field.setX @rank-1
      @field.setY @rank-1
      @field.addFigure '0'
      return true
    end
    false
  end

  def tryGeneralRules
     return true if universalGenRules '0'
     universalGenRules 'X'
  end

  def universalGenRules  toFind
    for i in (0..@rank-1) do    #columns
      count=0
      flag=false   #ці есьць вольныя клеткі
      for j in (0..@rank-1) do
        if toFind==@arr[i][j]
          count+=1
        end
        if @arr[i][j]=='empty'
          flag=true
        end
      end
      if count==@rank-1 && flag
        j=0
        while @arr[i][j]!='empty'
          j+=1
        end
        @field.setX j
        @field.setY i
        @field.addFigure '0'
        return true
      end
    end

    for i in (0..@rank-1) do    #columns
      count=0
      flag=false
      for j in (0..@rank-1) do
        if toFind==@arr[j][i]
          count+=1
        end
        if @arr[j][i]=='empty'
          flag=true
        end
      end
      if count==@rank-1 && flag
        j=0
        while @arr[j][i]!='empty'
          j+=1
        end
        @field.setX i
        @field.setY j
        @field.addFigure '0'
        return true
      end
    end
    #\
    count=0
    flag=false
    for i in (0..@rank-1) do
      if toFind==@arr[i][i]
        count+=1
      end
      if @arr[i][i]=='empty'
        flag=true
      end
    end
    if count==@rank-1 && flag
      j=0
      while @arr[j][j]!='empty'
        j+=1
      end
      @field.setX j
      @field.setY j
      @field.addFigure '0'
      return true
    end

    count=0
    flag=false
    for i in (0..@rank-1) do
      if (toFind==@arr[i][@rank-1-i])
        count+=1
      end
      if @arr[i][@rank-1-i]=='empty'
        flag=true
      end
    end
    if count==@rank-1 && flag
      j=0
      while @arr[j][@rank-j-1]!='empty'
        j+=1
      end
      @field.setX @rank-1-j
      @field.setY j
      @field.addFigure '0'
      return true
    end
    false
  end

  def tryCenter
    temp=@rank/2
    if(@arr[temp][temp]=='empty')
       @field.setX temp
       @field.setY temp
       @field.addFigure '0'
       return true
    end
    false
  end
end
