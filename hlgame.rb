require_relative 'app'
class Hlgame

  def initialize
    place_bet
  end

  def place_bet
    @bet = gets.to_f
    if @bet <= @sum
      hi_low_game
      else 
      puts "Insuffient Funds"
      gomenu = Casino.new
      x = gomenu.menu
      puts x
      place_bet()
          
    end

  def hi_low_game

      puts "Welcome to a game of high-low."

    playagain = "y"  
    while playagain == "y" 

    win = false

    randNum = rand(10) + 1

    puts "Please enter a number (1-10) or -1 to back to menu: "
	
    while !win
        guessedNumber = gets.to_i

       
        if guessedNumber == -1 then
            puts x
        end
		
        
        if guessedNumber > randNum then
          
            puts "Too low you lose."
            @bet - @bankroll
            puts @sum
            puts "want to play again?(y/n)"
            playagain = gets.chomp!
        if playagain == "y"
            place_bet
        else playagain ="n"
          puts "see you next time"
          puts x
        end

        elsif guessedNumber < randNum then
            puts "Too low you lose."
            @bet - @bankroll
            puts @sum

            puts "want to play again?(y/n)"
            playagain = gets.chomp!
            if playagain == "y"
              place_bet
            else playagin ="n"
              puts "see you next time"
              puts x
          end
           
        else
            puts "You win!"
            @bet - @bankroll
            puts "Want to play again? (y/n)"
            playagain = gets.chomp!
            if playagain =="y"
              playagain

            
            win = true
        end
    end
	
    puts "Want to play again? (y/n)"
    playagain = gets.chomp!

end

  end
end
end
end
Hlgame.new