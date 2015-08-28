#  At the start of each match prompt for the name of the player

def match_init
  puts "Hurry, the match is starting!"      # => nil
  puts "But first... what is your name?"    # => nil
  name = gets.chomp                         # ~> NoMethodError: undefined method `chomp' for nil:NilClass
#  If no name is given, the program should end
  if name == ""
    puts "WHOOPS!"
    exit
  else
    puts "Ok, #{name}, let's get started!"
  end
end

def throw_vs_ai
  counter = 0
  while counter < 2
    puts counter #TESTER
    ai_shoot = ["Rock", "Paper", "Scissors"].sample
    puts ai_shoot #TESTER
    puts "press '1' for Rock, press '2' for Paper, or press '3' for Scissors."
    user_shoot = gets.chomp
    if user_shoot == "1"
      user_shoot = "Rock"
    elsif user_shoot == "2"
      user_shoot = "Paper"
    elsif user_shoot == "3"
      user_shoot = "Scissors"
    else
      puts "Do you even know how to play this game?!"
      exit
    end
    puts "RO... SHAM... BO!"
    puts user_shoot #TESTER
    puts "Computer picks #{ai_shoot} and you picked #{user_shoot}."
    if user_shoot != ai_shoot
      counter += 1
    else
      puts "TIE! Go again!"
    end

  end
  puts "WINNER!"
end

match_init
throw_vs_ai

# >> Hurry, the match is starting!
# >> But first... what is your name?

# ~> NoMethodError
# ~> undefined method `chomp' for nil:NilClass
# ~>
# ~> /Users/michaelreed/tiy/roshambo/roshambo.rb:6:in `match_init'
# ~> /Users/michaelreed/tiy/roshambo/roshambo.rb:47:in `<main>'
