### GEMS ###
require 'colorize'

### RELATIVE PATHS ###
require_relative 'deck'
require_relative 'dice'
require_relative 'card'
require_relative 'account'
require_relative 'slot'
require_relative 'roulette'
# require_relative 'hlgame'


  
class Casino
  
  
  def app
    @new_player = Account.new
    
    
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:yellow)
    puts "WELCOME TO THE RUBY RED CASINO!".colorize(:red)
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:yellow)
    @new_player.get_name
    puts "Hello #{@new_player.name}, enter how much money you're ready to lose."
    @new_player.get_cash
    puts "\nPlease follow me into the casino...\n\n"
    menu()
  end
  
   def menu
    puts "~~~~~ CASINO  ~~~~~".colorize(:red)
    puts "1) Play Slots"
    puts "2) Play High / Low"
    puts "3) Roulette"
    puts "4) View Account"
    puts "5) Exit"
    user_selection = gets.to_i
    case user_selection
    when 1
      #Initiate slots game. Takes input of current account balance and outputs result.
      balance = @new_player.sum_bankroll
      slots = Slots.new(balance)
      x = slots.run_slots
      @new_player.update_bankroll(x)
      menu()
    when 2
      
      # high_low=Hlgame.new
      # x = high_low.hlgame
      # puts x
      # menu()
    when 3
      balance = @new_player.sum_bankroll
      roulette = Roulette.new(balance)
      x = roulette.menu
      @new_player.update_bankroll(x)
      menu()
    when 4
      #Displays money account balance & provides account options. 
      balance = @new_player.sum_bankroll
      puts "Your current balance is $#{sprintf("%.2f",balance)}."
      puts "1) Add Money to Account"
      puts "2) Cash Out"
      puts "3) Return to Casino"
      account_input = gets.to_i
      case account_input
      when 1
        #Adds money to current account balance
        cash_added = @new_player.add_money
        new_balance = @new_player.sum_bankroll
        puts "Your new account balance is $#{new_balance}."
        menu()
      when 2
        puts "
              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$$$$$,,,$$$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$$$$$OOO$$$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$$$$!OOO!$$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$$$,$OOO$,$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$,$OOOOOOO$,$$$$$$$$$$$$$
              $$$$$$$$$$$$!$OOOOOOOOOOO$!$$$$$$$$$$$
              $$$$$$$$$$,$OOOOOOOOOOOOOOO$,$$$$$$$$$
              $$$$$$$$,1OOOOOOOOOOOOOOOOOOO7,$$$$$$$
              $$$$$$,!OOOOOOOOOOOOOOOOOOOOOO$$$$$$$$
              $$$$$$,!OOOOOOOO $$$$! OOOOOOOO1$$$$$$
              $$$$$$$,OOOOOOOO $$$$! OOOOOOOO$$$$$$$
              $$$$$$$,OOOOOOOOOO!$$$|,OOOOOOO!$$$$$$
              $$$$$$$$,OOOOOOOOOOO,$$$--------$$$$$$
              $$$$$$$$,!OOOOOOOOOOOO,$$$$$$$$$$$$$$$
              $$$$$$$$$$,,OOOOOOOOOOO,,$$$$$$$$$$$$$
              $$$$$$$$$$$$,OOOOOOOOOOOO,,$$$$$$$$$$$
              $$$$$$$$$$$$$,!OOOOOOOOOOOO,+$$$$$$$$$
              $$$$$$$$$$$$$$$,==OOOOOOOOOOO,$$$$$$$$
              $$$$$$---------$$$,,OOOOOOOOOO,,$$$$$$
              $$$$$$,,OOOOOO,,$$$$,,OOOOOOOOO!$$$$$$
              $$$$$$1OOOOOOOO.,~~~,OOOOOOOOOO!$$$$$$
              $$$$$$!OOOOOOOOOOOOOOOOOOOOOOO1$$$$$$$
              $$$$$$$,OOOOOOOOOOOOOOOOOOOOO,$$$$$$$$
              $$$$$$$$,OOOOOOOOOOOOOOOOOOO!$$$$$$$$$
              $$$$$$$$$1OOOOOOOOOOOOOOOO,1$$$$$$$$$$
              $$$$$$$$$$,~~,OOOOOOOOOO,,$$$$$$$$$$$$
              $$$$$$$$$$$$$$,,1OOO1,,$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$$$$!OOO!$$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$$$$,OOO,$$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$$$$$,,,$$$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      when 3
        #Returns to main casino menu.
        menu()
      end
    when 5
      return
    end
  
  end

end

game = Casino.new
game.app()  