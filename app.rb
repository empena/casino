require_relative 'deck'
require_relative 'dice'
require_relative 'card'
require_relative 'account'
require_relative 'slot'
# require_relative 'hlgame'


  
class Casino
  
  
  def app
    @new_player = Account.new
    
    
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "WELCOME TO THE RUBY RED CASINO!"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    @new_player.get_name
    puts "Hello #{@new_player.name}, enter how much money you're ready to lose."
    @new_player.get_cash
    puts "\nPlease follow me into the casino...\n\n"
    menu()
  end
  
   def menu
    puts "~~~~~ CASINO  ~~~~~"
    puts "1) Play Slots"
    puts "2) Play High / Low"
    puts "3) View Account"
    puts "4) Exit"
    user_selection = gets.to_i
    case user_selection
    when 1
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
      puts "Your current balance is $#{sprintf("%.2f",balance)}."
      puts "1) Add Money to Account"
      puts "2) Cash Out"
      puts "3) Return to Casino"
      account_input = gets.to_i
      case account_input
      when 1
        cash_added = @new_player.add_money
        new_balance = @new_player.sum_bankroll
        puts "Your new account balance is $#{new_balance}."
        menu()
      when 2
        # Fun cash out program - Sounds? Crazy text? 
      when 3
        menu()
      end

    when 4
      return
    end
  end

end

game = Casino.new
game.app()