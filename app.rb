require_relative 'deck'
require_relative 'dice'
require_relative 'card'
<<<<<<< HEAD
require_relative 'account'
=======
require_relative 'hlgame'
>>>>>>> “Hilowgame_draft”


<<<<<<< HEAD
  
class Casino
=======
  def bet
    @bet = gets.to_f
    if @bet # < @Bankroll
      # go
    else @bet # > @Bankroll
      puts "Insuffient Funds"
      # go to menu      
    end
  end
end

class App
  def initialize 
    @new_player = Player.new
    @new_wallet = Wallet.new
  app
  end
>>>>>>> “Hilowgame_draft”
  def app
    puts "**********************************"
    puts "Welcome to the Honeybadger Casino!"
<<<<<<< HEAD
    puts "**********************************"
    new_player = Account.new
    new_player.get_name
    puts "Hello #{new_player.name}, enter how much money your ready to lose."
    new_player.get_cash
  
    # menu
  end
end

game = Casino.new
game.app()
=======
    puts "Enter your name"
  
    @new_player.get_name
    puts "Hello #{@new_player.name}, enter how much money your ready to lose."
    
    @new_wallet.get_wallet
    puts "Your starting balance is #{sprintf("%.2f",@new_wallet.wallet)}"
  end
    def menu
      puts 'test'
    end
    
   
    
  
end



>>>>>>> “Hilowgame_draft”
