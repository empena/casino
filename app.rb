require_relative 'deck'
require_relative 'dice'
require_relative 'card'
require_relative 'account'


  
class Casino
  def app
    puts "**********************************"
    puts "Welcome to the Honeybadger Casino!"
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