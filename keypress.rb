require 'io/console'

def read_char
  STDIN.echo = false
  STDIN.raw!

  input = STDIN.getc.chr
  if input == "\e" then
    input << STDIN.read_nonblock(3) rescue nil
    input << STDIN.read_nonblock(2) rescue nil
  end
ensure
  STDIN.echo = true
  STDIN.cooked!

  return input
end

def show_single_key
  c = read_char

  case c
  # when " "
  #   puts "SPACE"
  # when "\t"
  #   puts "TAB"
  when "\r"
    return "RETURN"
  # when "\n"
  #   puts "LINE FEED"
  # when "\e"
  #   puts "ESCAPE"
  when "\e[A"
    return "UP"
  when "\e[B"
    return "DOWN"
  when "\e[C"
    return "RIGHT"
  when "\e[D"
    return "LEFT"
  # when "\177"
  #   puts "BACKSPACE"
  # when "\004"
  #   puts "DELETE"
  # when "\e[3~"
  #   puts "ALTERNATE DELETE"
  when "\u0003"
    puts "CONTROL-C"
    exit 0
  # when /^.$/
  #   puts "SINGLE CHAR HIT: #{c.inspect}"
  else
    puts "SOMETHING ELSE: #{c.inspect}"
  end
end