require_relative 'cursor.rb'

class Screen

  def self.clear
    system 'clear'
  end

  def self.show
    resize
    clear
    border
  end

  def self.resize
    print "#{CSI}8;40;120t"
  end

  def self.border

    system 'clear'
    
    x1 = 60
    x2 = 61
    y1 = 1
    y2 = 1
    
    60.times do
      Cursor.move([x1, y1])
      print " ".on_white
      Cursor.move([x2,y2])
      print " ".on_white
      x1 -= 1
      x2 += 1
      sleep(0.05)
    end

    40.times do
      Cursor.move([x1, y1])
      print " ".on_white
      Cursor.move([x2, y2])
      print " ".on_white
      y1 += 1
      y2 += 1
      sleep (0.05)
    end

    
    x1 = 1
    x2 = 120
    60.times do
      y1 = 33
      y2 = 33
      10.times do
        Cursor.move([x1, y1])
        print " ".on_white
        Cursor.move([x2, y2])
        print " ".on_white
        y1 += 1
        y2 += 1
      end
      x1 += 1
      x2 -= 1
      sleep(0.05)
    end

  end

  def self.grid(square)
    x = []
    case square[0]
    when "a"
      x = [1,20]
    when "b"
      x = [20,40]
    when "c"
      x = [40,60]
    when "d"
      x = [60,80]
    when "e"
      x = [80,100]
    when "f"
      x = [100,120]
    end

    y = []
    case square[1].to_i
    when 1
      y = [1,10]
    when 2
      y = [10,20]
    when 3
      y = [20,30]
    when 4
      y = [30,40]
    end
    return {x: x, y: y}
  end

  def self.grid_start(square)
    grid = self.grid(square)
    return [grid[:x][0], grid[:y][0]]
  end

  def self.grid_end(square)
    grid = self.grid(square)
    return [grid[:x][1], grid[:y][1]]
  end

end