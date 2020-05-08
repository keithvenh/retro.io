require 'colorize'
CSI = "\e["
class Cursor

  def self.move(loc)
    $stdout.write "#{CSI}#{loc[1]};#{loc[0]}H"
  end
  
  def self.set_color(color)
    system('echo "\e]12;' +  color + '\a"')
  end

  def self.hide
    system('tput civis')
  end
  
end

