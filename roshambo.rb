class Game

  def initialize
    @ui_score = {:engagement => 0, :bout => 0, :match => 0, :total_matches => 0}
    @ai_score = {:engagement => 0, :bout => 0, :match => 0, :total_matches => 0}
    @ui_point = 0
    @ai_point = 0
    puts "Hurry, the match is starting!"
    puts "But first... what is your name?"
    @name = gets.chomp
    @counter = 0
    if @name == ""
      puts "No one there? Ok, bye!"
      exit
    else
      puts "Ok, #{@name}, let's get started!"
    end
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
      puts "Do you even know how to play this game?!"
      exit
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
      puts "Bout -- #{@name}!" #<=== change player to @player_name
      # puts "Begin next bout!" #<=== call on bout? match?
      @ui_score[:engagement] = 0
      @ui_score[:bout] += 1
      @ai_score[:engagement] = 0
    end
    if @ai_score[:engagement] == 2
      puts "Bout -- Computer!" #<=== change player to @player_name
      # puts "Begin next bout!" #<=== call on bout? match?
      @ui_score[:engagement] = 0
      @ai_score[:engagement] = 0
      @ai_score[:bout] += 1
    end
      ##MATCH
      if @ui_score[:bout] == 2
        puts "Match -- #{@name}!" #<=== change player to @player_name
        # puts "Begin next bout!" #<=== call on bout? match?
        @ui_score[:engagement] = 0
        @ui_score[:bout] = 0
        @ai_score[:engagement] = 0
        @ai_score[:bout] = 0
        @ui_score[:match] += 1
      elsif @ai_score[:bout] == 2
        puts "Match -- Computer!" #<=== change player to @player_name
        # puts "Begin next bout!" #<=== call on bout? match?
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
  # puts @ai_point  ##DEBUG
  # puts @ui_point  ##DEBUG
  end

  def bout
    while @ui_score[:match] < 1 && @ai_score[:match] < 1
    ai_choice
    user_choice
    winner
    match_tally
    puts "#{@name}:"
    puts "     <<#{@ui_score}>>"
    puts "Computer:"
    puts "     <<#{@ai_score}>>"
    end
    if @ui_score[:match] == 1
      @ui_score[:match] = 0
      @ui_score[:total_matches] = 1
      puts "Game! Winner: #{@name}!!!"
      message = %{
       __    __  ____  ____   ____     ___  ____   __
      |  |__|  ||    ||    \\ |    \\   /  _]|    \\ |  |
      |  |  |  | |  | |  _  ||  _  | /  [_ |  D  )|  |
      |  |  |  | |  | |  |  ||  |  ||    _]|    / |__|
      |  `  '  | |  | |  |  ||  |  ||   [_ |    \\  __
       \\      /  |  | |  |  ||  |  ||     ||  .  \\|  |
        \\_/\\_/  |____||__|__||__|__||_____||__|\\_||__|
      }
      puts message
    elsif @ai_score[:match] == 1
      @ai_score[:match] = 0
      @ai_score[:total_matches] = 1
      puts "Game! Winner: Computer!"
    end
    play_again
  end

  def play_again
    puts @ui_score
    puts @ai_score
    puts "Would you like to play again?"
    puts "Press '1' to play again or any other key to exit."
    replay = gets.to_i
    if replay == 1
      bout
    else
      puts "Are you *SURE* you want to quit?"
      puts "Press '1' to exit or any other key to play again."
      quit = gets.to_i
      if quit == 1
        puts "Are you sure you're sure...?"
        yes = gets
        puts "LOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOLOL"
        exit
      else
        bout
      end
    end
  end
end

bout = Game.new
bout.bout
