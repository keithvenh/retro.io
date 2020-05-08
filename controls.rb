require 'colorize'
require_relative 'keypress.rb'
require_relative 'menu.rb'
require_relative 'cursor.rb'
require_relative 'screen.rb'


class Controls
  @grid = Screen.grid("a4")
  @grid_start = Screen.grid_start("a4")
  @grid_end = Screen.grid_end("a4")
  @main_menu = ["Characters", "Items", "Objectives", "Profile", "Stats", "Upgrade", "Train", "Heal"]
    
  def self.home
    menu = menu(@main_menu)
    Cursor.move([10,10])
  end

  def self.input(layout)
    Cursor.move([@grid_start[0]+3, @grid_start[1]+4])
    selected = 1
    case selected
    when 1
      Cursor.move([3, 34])
      print (" " + layout["#{selected}"][0] + " ").white.on_blue.bold
    end

    Cursor.move([20,20])

    pressed = show_single_key
    puts pressed

  end

  def self.selector(menu, opt)

    menu.show
    slots = Menu.menu_slots[0..menu.options.length-1]
    Cursor.move(slots[opt])
    print " #{menu.options[opt].upcase} ".white.on_blue.bold

    selection = nil

    until selection do
      key = show_single_key
      case key
      when "UP"
        if opt > 3
          opt -=4
        elsif menu.options(opt + 8)
          opt += 8
        elsif menu.options[opt + 4]
          opt +=4
        else
          opt = menu.options.length - 1
        end
      when "DOWN"
        if menu.options[opt + 4]
          opt += 4
        elsif opt > 7
          opt -= 8
        elsif opt > 3
          opt -= 4
        else
          opt = menu.options.length - 1
        end
      when "RIGHT"
        opt < menu.options.length - 1 ? opt += 1 : opt = 0
      when "LEFT"
        opt > 0 ? opt -= 1 : opt = menu.options.length - 1
      when "RETURN"
        selection = menu.options[opt]
      end

      Cursor.move([10,10])
      print opt
      menu.show

      Cursor.move(slots[opt])
      print " #{menu.options[opt].upcase} ".white.on_blue.bold
    end

    Cursor.move([10,10])
    print "You have selected #{selection}"
    return selection.upcase

  end

end