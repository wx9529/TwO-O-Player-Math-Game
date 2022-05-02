require './player.rb'

class Game 
  # attr_accessor :player_first, :player_second, :current_player
  def initialize
    self.player_first = Player.new(3)
    self.player_second = Player.new(3)
    self.current_player = 1
  end

  def prompt_question
    num1 = rand(1 .. 20)
    num2 = rand(1 .. 20)
    answer = num1 + num2
    puts "Player #{current_player}: what does #{num1} plus #{num2} equal?"
    input = gets.chomp.to_i
    if answer == input
      puts "Player #{current_player}: YES! You are correct"
    else
      puts "Player #{current_player}: Seriously? No!"
      if current_player == 1 
        player_first.modify_life 
      else
        player_second.modify_life 
      end 
    end
  end

  def print_res 
     "P1: #{player_first.life}/3 vs P2: #{player_second.life}/3"
  end

  def change_current_player
    if current_player == 1
      self.current_player = 2
    else 
      self.current_player = 1
    end
  end

  def check_winner
    if player_first.life == 0
      puts "Player #{2} wins with a score of #{player_second.life}/3"
      return true 
    elsif player_second.life == 0
      puts "Player #{1} wins with a score of #{player_first}/3"
      return true
    end
    return false 
  end

  def play_game
    while true
      prompt_question
      puts print_res
      puts "----- NEW TURN -----"
      change_current_player
      if check_winner
        puts "----- GAME OVER -----"
        puts "Good bye!"
        break
      end 
    end
  end

end
