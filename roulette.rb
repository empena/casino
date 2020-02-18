class Roulette

  def initialize(balance)
    @cashflow = [balance]
    @winnings = []
    @balance = balance
    
  end
  
  
  def menu
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "               RUBY ROULETTE TABLE"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
    puts "Press ENTER to place a new bet, or Q to exit."
    menu_choice = gets.strip
    if menu_choice == "Q" || menu_choice == "q"
      winnings = sum_winnings()
      puts "Thank you for playing Ruby Roulette. Your winnings are: $#{winnings}"
      return
    else
    place_bet()
    end
  end
  
  def place_bet
    cashflow = @cashflow.inject(0) {|result, element|result + element}
    puts "\nYour current account balance is $#{cashflow}"
    puts "Please enter bet amount:"
    bet_money = gets.to_f
  
    if bet_money <= @balance && @balance >= cashflow
      puts "Please enter bet type:\n\n"
      puts "          ~~~~ INSIDE BETS ~~~~~"
      puts "1) Inside Bet (One Number)         Odds 35:1"
      puts "2) Split Bet (Between Two Numbers) Odds 17:1"
      puts "3) Street Bet (Three Numbers)      Odds 11:1"
      puts "4) Corner Bet (Four Numbers)       Odds 8:1"
      puts "4) Six-line Bet (Six Numbers)      Odds 5:1"
      puts "          ~~~~ OUTSIDE BETS ~~~~~"
      puts "5) Color bet Red or Black          Odds 1:1"
      puts "6) Even or Odd Bet                 Odds 1:1"
      puts "7) Column Bet                      Odds 2:1"
      puts "8) Dozen Bet (1-12)                Odds 2:1"
      input = gets.to_i
      case input
      when 1
        bet_number = one_bet()
        spin_number = spin()
        if bet_number == spin_number
          puts "WINNER!!!!"
          game_result = (bet_money * 35)
          cashflow_update(game_result)
          winnings_update(game_result)
          menu()
        else
          puts "Better luck next spin!"
          game_result = -(bet_money)
          cashflow_update(game_result)
          winnings_update(game_result)
          menu()
        end

      when 2
      when 3
      when 4
      when 5
      when 6
      when 7
      when 8
      when 9
      end
      
      
    else
      puts "Insufficient Funds. Please return to Casino to add to account."
      return
    end
  end

  def spin
    wheel = rand(36)
    puts "\n** Croupier spins the wheel! **"
    puts "_.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._"
    puts "\nBall lands on #{wheel}"
    return wheel
  end

  def cashflow_update(game_result)
    @cashflow.push(game_result)
  end

  def winnings_update(game_result)
    @winnings.push(game_result)
  end

  def sum_cashflow
    sum_cashflow = @cashflow.inject(0) {|result, element|result + element}
    return sum_cashflow
  end

  def sum_winnings
    sum_winnings = @winnings.inject(0) {|result, element|result + element}
    return sum_winnings
  end


  def one_bet
    puts "Please enter the number 0-36 you would like to bet on:"
    bet_number = gets.to_i
    return bet_number
  end

  

end

x = Roulette.new(450)
x.menu