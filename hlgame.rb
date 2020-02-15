require_relative 'app'
class Hlgame

  def initialize
    
  end

def Add_money
  puts"you can add money here"
hi_low_game
end

 def hi_low_game


  
  puts "Welcome to a game of high-low."

playagain = "y"  
while playagain == "y" #wallet money > bet

    win = false

    randNum = rand(10) + 1

    puts "Please enter a number (1-10) or -1 to back to menu: "
	
    while !win
        guessedNumber = gets.to_i

        # Wants to quit
        if guessedNumber == -1 then
            
        end
		
        # Lets compare our number to computer number
        if guessedNumber > randNum then
          # - bet to bet from wallet
            puts "Too low you lose."
            puts "want to play again?(y/n)"
            playagain = gets.chomp!
        if playagain == "y"
          hi_low_game
        else playagain ="n"
          puts "lol"
          exit
        end

        elsif guessedNumber < randNum then
          # - bet from wallet
            puts "Too low you lose."
            puts "want to play again?(y/n)"
            playagain = gets.chomp!
            if playagain == "y"
              hi_low_game
            else playagin ="n"
              puts "lol"
              exit
            end
           
        else
            puts "You win!"
            #add bet to wallet
            puts "Want to play again? (y/n)"
            playagain = gets.chomp!
            if playagain =="y"
              hi_low_game

            #add bet to wallet
            win = true
        end
    end
	
    # If we reached here, the game has ended, ask the user if they want to play again.
    puts "Want to play again? (y/n)"
    playagain = gets.chomp!

end

puts "Thanks for playing!"
  end
end


 
  
 

  def game_rule
    puts 'kjkjkjkjkli'
     end   
  
    end

     Hlgame.new.hi_low_game

