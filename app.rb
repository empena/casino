require_relative 'deck'
require_relative 'dice'
require_relative 'card'

class Player
  attr_accessor :name # Do we need this?
    def inititalize
      @name = name
    end
    def get_name
      @name = gets.strip
    end
  end


class Wallet
  attr_accessor :wallet # Do we need this?
  def inititalize
    @wallet = wallet
    @bet = bet
  end
  def get_wallet
    @bankroll = []
    @wallet = gets.to_f
    @bankroll << @wallet
  end

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
  
  def app
    puts "Welcome to the Honeybadger Casino!"
    puts "Enter your name"
    new_player = Player.new
    new_player.get_name
    puts "Hello #{new_player.name}, enter how much money your ready to lose."
    new_wallet = Wallet.new
    new_wallet.get_wallet
    puts "Your starting balance is #{sprintf("%.2f",new_wallet.wallet)}"
    # menu
  end

app()