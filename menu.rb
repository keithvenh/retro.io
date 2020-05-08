require_relative 'keypress.rb'
class Menu
  attr_reader :options
  def self.menu_slots
    @@menu_slots
  end

  @@menu_slots = [[3, 34], [33, 34], [63, 34], [93, 34], 
                  [3, 36], [33, 36], [63, 36], [93, 36],
                  [3, 38], [33, 38], [63, 38], [93, 38]
                ]
  def initialize(options)
    @options = options
  end

  def clear
    Cursor.move([1,33])
    8.times do
      print (" "*120).on_white
    end
  end

  def show
    clear
    i = 0
    @options.each do |option|
      Cursor.move(@@menu_slots[i])
      print " #{option.upcase} ".black.on_white
      i += 1
    end
  end
end