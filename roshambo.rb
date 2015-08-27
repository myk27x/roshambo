#  At the start of each match prompt for the name of the player

def match_init
  puts "Hurry, the match is starting!"
  puts "But first... what is your name?"
  name = gets.chomp
#  If no name is given, the program should end
  if name == ""
    puts "WHOOPS!"
    exit
  else
    puts "Ok, #{name}, let's get started!"
  end
end

match_init
