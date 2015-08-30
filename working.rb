class Game

  def initialize
      @ui_score = {:engagement => 0, :bout => 0, :match => 0, :match_wins => 0, :match_losses => 0}
      @ai_score = {:engagement => 0, :bout => 0, :match => 0, :match_wins => 0, :match_losses => 0}
      @scorecard = {:match_wins => 0, :match_losses => 0}
      @ui_point = 0
      @ai_point = 0
      comp_stats
    puts "Rock, paper, scissors?! Sure, we can play!"
    puts "Whoops... hang on a sec... have you registered on our Leaderboard?"
    puts "Press (1) if yes, or (2) if no."
    played = gets.to_i
    if played == 1
      puts "Oh, ok, GOOD! Um... what was your name again?"
      @name = gets.chomp
      if @name == ""
        puts "Oh... ok... well... I don't play with people I don't know... so... bye..."
        exit
      else
        puts "Right, let me see if I can find your Scorecard..."
        player_scorecard
      end
    elsif played == 2
      puts "No big. It's easy. So... what's your name?"
      @name = gets.chomp
      if @name == ""
        puts "Oh... ok... well... I don't play with people I don't know... so... bye..."
        exit
      else
        puts "Now let me just add you to my Leaderboard..."
        new_scorecard
      end
    else
      puts "BZZZT! DOES NOT COMPUTE! **DIES**"
      exit
    end
      puts "Alright, #{@name}! Let's get started!"
  end

  # AI CHOOSE
  def ai_choice
    @ai_choice = [1,2,3].sample
    if @ai_choice == 1
      @ai_shoot = "Rock"
    elsif @ai_choice == 2
      @ai_shoot = "Paper"
    elsif @ai_choice == 3
      @ai_shoot = "Scissors"
    end
  end

  # USER CHOOSE
  def user_choice
    puts "Press '1' for Rock, press '2' for Paper, or press '3' for Scissors."
    @ui_choice = gets.to_i
    if @ui_choice == 1
      @user_shoot = "Rock"
    elsif @ui_choice == 2
      @user_shoot = "Paper"
    elsif @ui_choice == 3
      @user_shoot = "Scissors"
    else
      puts "Do you even know how to play this game?! Read the rules below..."
      bout
    end
    puts "RO... SHAM... BO!"
    puts "Computer throws #{@ai_shoot}....."
    puts "#{@name} throws #{@user_shoot}!"
  end

  # HAND-BOUT-MATCH TALLY
  def match_tally
    ##HAND
    if @ai_point == 1
      @ai_score[:engagement] += 1
    elsif @ui_point == 1
      @ui_score[:engagement] += 1
    end
    ##BOUT
    if @ui_score[:engagement] == 2
      puts "Bout -- #{@name}!"
      @ui_score[:engagement] = 0
      @ui_score[:bout] += 1
      @ai_score[:engagement] = 0
    end
    if @ai_score[:engagement] == 2
      puts "Bout -- Computer!"
      @ui_score[:engagement] = 0
      @ai_score[:engagement] = 0
      @ai_score[:bout] += 1
    end
      ##MATCH
      if @ui_score[:bout] == 2
        puts "Match -- #{@name}!"
        @ui_score[:engagement] = 0
        @ui_score[:bout] = 0
        @ai_score[:engagement] = 0
        @ai_score[:bout] = 0
        @ui_score[:match] += 1
      elsif @ai_score[:bout] == 2
        puts "Match -- Computer!"
        @ui_score[:engagement] = 0
        @ui_score[:bout] = 0
        @ai_score[:engagement] = 0
        @ai_score[:bout] = 0
        @ai_score[:match] += 1
    end
  @ai_point = 0
  @ui_point = 0
  end


  def winner
    case
  when @ui_choice == 1
    if @ai_choice == 2
      puts "Paper covers Rock! Engagement -- Computer!"
      @ai_point += 1
    elsif @ai_choice == 3
      puts "Rock crushes Scissors! Engagement -- #{@name}!"
      @ui_point += 1
    end
  when @ui_choice == 2
    if @ai_choice == 1
      puts "Paper covers Rock! Engagement -- #{@name}!"
      @ui_point += 1
    elsif @ai_choice == 3
      puts "Scissors cuts Paper! Engagement -- 'Computer!'"
      @ai_point += 1
    end
  when @ui_choice == 3
    if @ai_choice == 1
      puts "Rock crushes Scissors! Engagement -- Computer!'"
      @ai_point += 1
    elsif @ai_choice == 2
      puts "Scissors cuts Paper! Engagement -- #{@name}!"
      @ui_point += 1
    end
  end
  if @ui_choice == @ai_choice
    puts "Engagement -- TIE! Go again!"
  end
  end

  def bout
    while @ui_score[:match] < 1 && @ai_score[:match] < 1
    ai_choice
    user_choice
    winner
    match_tally
    print "#{@name}:"
    puts "     <<#{@ui_score}>>"
    print "Computer:"
    puts "     <<#{@ai_score}>>"
    end
    if @ui_score[:match] == 1
      @ui_score[:match] = 0
      @ui_score[:match_wins] += 1
      @scorecard[:match_wins] += 1
      @ai_score[:match_losses] += 1
      puts "Game! Winner: #{@name}!!!"
      message = %{
       __      __  ______  ____    __  ____    __  _______ _______    __
      |  |    |  ||_    _||    \\  |  ||    \\  |  ||   ____|   __  \\  |  |
      |  |    |  |  |  |  |  |  \\ |  ||  |  \\ |  ||  |__  |  |__|  ) |  |
      |  | /\\ |  |  |  |  |  |   \\|  ||  |   \\|  ||   __| |  |    /  |  |
      |  \\/  \\/  |  |  |  |  | \\  |  ||  | \\  |  ||  |    |  | \\ \\   |__|
      \\    /\\    / _|  |_ |  |  \\    ||  |  \\    ||  |____|  |  \\ \\   __
       \\__/  \\__/ |______||__|   \\___||__|   \\___||_______|__|   \\_\\ |__|
      }
      puts message
    elsif @ai_score[:match] == 1
      @ai_score[:match] = 0
      @ai_score[:match_wins] += 1
      @scorecard[:match_losses] += 1
      @ui_score[:match_losses] += 1
      puts "Game! Winner: Computer!"
      message = %{
       __         _____     _____  _______ _______    __
      |  |      /   _  \\  /  _   \\|   ____|   __  \\  |  |
      |  |      |  | |  ||  / |__||  |__  |  |__|  ) |  |
      |  |      |  | |  | \\ \\____ |   __| |  | ___/  |  |
      |  |      |  | |  | _\\____ \\|  |    |  | \\ \\   |__|
      |  |_____ |  |_|  ||  \\___| |  |____|  |  \\ \\   __
      |________|\\ _____/ \\_______/|_______|__|   \\_\\ |__|
      }
      puts message
    end
    play_again
  end
## -- add message for win/lose replay
  def play_again
    board
    puts "How about another match?"
    puts "Press '1' to play again or any other key to exit."
    replay = gets.to_i
    if replay == 1
      bout
    else
      puts "Are you *SURE* you want to quit?"
      puts "Press '1' to exit or any other key to play again."
      quit = gets.to_i
      if quit == 1
        puts "Are you sure you're sure you're sure???"
        gets
        puts "LOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOL"
        scorecard_update
        exit
      else
        bout
      end
    end
  end

  def player_scorecard
    @user = @name
    ui_homedir = Dir.home ()
    Dir.chdir (ui_homedir)
    if File.exist? ("#{@user}.roshambo")
      # READING FROM FILE
      file = File.open("#{@user}.roshambo", "r")
      @scorecard[:match_wins] = file.gets.to_i
      @scorecard[:match_losses] = file.gets.to_i
      file.close
      @ui_score[:match_wins] = @scorecard[:match_wins]
      @ui_score[:match_losses] = @scorecard[:match_losses]
      if @scorecard[:match_wins] == nil # WHOLE IF STATEMENT REDUNDANT???
        puts "I don't see you in here..."
        puts "Let's just start you a new Scorecard..."
        @scorecard = {:match_wins => 0, :match_losses => 0}
      else
        puts "Here's our Leaderboard..."
        board
        puts "Yep! Here's your Scorecard right here!"
        give_card
      end
    else
      puts "I don't see you in here..."
      puts "Let's just start you a new Scorecard..."
      new_player = File.new("#{@user}.roshambo", "w+")
      new_player.close
      puts "Here's your new Scorecard... (try not to lose it again!)"
      give_card
    end
  end

def new_scorecard
  @user = @name
  ui_homedir = Dir.home ()
  Dir.chdir (ui_homedir)
  if File.exist? ("#{@user}.roshambo")
    puts "Wait a sec... it says #{@name} right here on the Leaderboard!"
    board
    file = File.open("#{@user}.roshambo", "r")
    @scorecard[:match_wins] = file.gets.to_i
    @scorecard[:match_losses] = file.gets.to_i
    file.close
    @ui_score[:match_wins] = @scorecard[:match_wins]
    @ui_score[:match_losses] = @scorecard[:match_losses]
    puts "This is your card right here!"
    give_card
  else
    new_player = File.new("#{@user}.roshambo", "w+")
    new_player.close
    puts "Let's add you to our Leaderboard..."
    board
    puts "and here's a new Scorecard for you!"
    give_card
    puts "Oh, and don't worry if you lose it. I'll keep track of it on this computer, ok? Ok."
  end

end

  def scorecard_update
    compfile = File.open("comp_stats.roshambo", "w")
    compfile.puts @ai_score[:match_wins]
    compfile.puts @ai_score[:match_losses]
    compfile.close
    puts "Oh, wait, before you go..."
    puts "Let's update your stats to our leaderboard..."
    puts "Here's your updated Scorecard:"
    give_card
    # WRITING TO FILE
    file = File.open("#{@user}.roshambo", "w")
    file.puts @scorecard[:match_wins]
    file.puts @scorecard[:match_losses]
    file.close
  end

    def give_card
      puts "//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\\\\ "
      puts " #{@name}=====#{@scorecard}"
      puts "\\\\=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-//"
    end

    def comp_stats
      ui_homedir = Dir.home ()
      Dir.chdir (ui_homedir)
      if File.exist? ("comp_stats.roshambo")
        file = File.open("comp_stats.roshambo", "r")
        @ai_score[:match_wins] = file.gets.to_i
        @ai_score[:match_losses] = file.gets.to_i
        file.close
      else
        new_comp = File.new("comp_stats.roshambo", "w+")
        new_comp.close
      end
    end

    def board
      puts "//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\\\\ "
      puts " #{@name}=====#{@ui_score}"
      puts "||-----------------------------------------------------------------------------------||"
      puts " Computer=====#{@ai_score}"
      puts "\\\\=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=//"
    end

end

bout = Game.new
bout.bout

## CHANGE LOG ##
# -- notified what game you're playing
# -- modified messages
