class Roulette

  def initialize(balance)
    @cashflow = [balance]
    @winnings = []
    @balance = balance
    
  end
  
  
  def menu
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "             RUBY RED ROULETTE TABLE"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
    puts "Press ENTER to place a new bet, or Q to exit."
    menu_choice = gets.strip
    if menu_choice == "Q" || menu_choice == "q"
      winnings = sum_winnings()
      puts "Thank you for playing Ruby Roulette. Your winnings are: $#{winnings}"
      return winnings
    else
    place_bet()
    end
  end
  
  def place_bet
    cashflow = @cashflow.inject(0) {|result, element|result + element}
    puts "Your current account balance is $#{cashflow}\n"
    puts "\nPlease enter bet amount:"
    @bet_money = gets.to_f
  
    if @bet_money <= @balance && @balance >= cashflow
      puts "Please enter bet type:\n\n"
      puts "          ~~~~ INSIDE BETS ~~~~~"
      puts "1) Inside Bet (One Number)         Odds 35:1"
      puts "2) Split Bet (Between Two Numbers) Odds 17:1"
      puts "3) Street Bet (Three Numbers)      Odds 11:1"
      puts "4) Corner Bet (Four Numbers)       Odds 8:1"
      puts "5) Six-line Bet (Six Numbers)      Odds 5:1"
      puts "          ~~~~ OUTSIDE BETS ~~~~~"
      puts "6) Color bet Red or Black          Odds 1:1"
      puts "7) Even or Odd Bet                 Odds 1:1"
      puts "8) Column Bet                      Odds 2:1"
      puts "9) Dozen Bet (1-12)                Odds 2:1"
      input = gets.to_i
      case input
      when 1
        bet_number = one_bet()
        spin_number = spin()
        if bet_number == spin_number
          winner(35)
        else
          loser()
        end

      when 2
        two_bet()
      when 3
        three_bet()
      when 4
        four_bet()
      when 5
        six_bet()
      when 6
        color_bet()
      when 7
        even_odd_bet()
      when 8
        column_bet()
      when 9
        dozen_bet()
      end
      
      
    else
      puts "Insufficient Funds. Please return to Casino to add to account."
      return
    end
  end

  def spin
    wheel = rand(36)
    reds = [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,24,36]
    blacks = [2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33,35]
    if reds.include?(wheel)
      @color = "red"
    else
      @color = "black"
    end
    puts "\n** Croupier spins the wheel! **"
    puts "_.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._\n"
    puts "\nBall lands on ====> #{@color.upcase} #{wheel} <===="
    return wheel
  end
  def spin_color
    wheel = rand(36)
    reds = [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,24,36]
    blacks = [2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33,35]
    if reds.include?(wheel)
      @color = "red"
    else
      @color = "black"
    end
    puts "\n** Croupier spins the wheel! **"
    puts "_.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._\n"
    puts "\nBall lands on ====> #{@color.upcase} #{wheel} <===="
    return @color
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

  def winner(multiplyer)
    puts "\nWINNER!!!!"
    game_result = (@bet_money * multiplyer)
    puts "You win $#{game_result}!"
    cashflow_update(game_result)
    winnings_update(game_result)
    menu()
  end

  def loser
    puts "\nBetter luck next spin!"
    puts "You're down $#{@bet_money}"
    game_result = -(@bet_money)
    cashflow_update(game_result)
    winnings_update(game_result)
    menu()
  end

  def one_bet
    puts "Inside Bet - Please enter the number 0-36 you would like to bet on:"
    bet_number = gets.to_i
    return bet_number
  end

  def two_bet
    puts "Split Bet - Please enter two numbers 0-36 you would like to bet on."
    puts "First Number:"
    bet_number1 = gets.to_i
    puts "Second Number:"
    bet_number2 = gets.to_i
    spin_number = spin()
    if bet_number1 == spin_number || bet_number2 == spin_number
      winner(17)
    else
      loser()
    end
  end

  def three_bet
    puts "Street Bet - Please enter three numbers 0-36 you would like to bet on."
    puts "First Number:"
    bet_number1 = gets.to_i
    puts "Second Number:"
    bet_number2 = gets.to_i
    puts "Third Number:"
    bet_number3 = gets.to_i
    spin_number = spin()
    if bet_number1 == spin_number || bet_number2 == spin_number || bet_number2 == spin_number 
      winner(11)
    else
      loser()
    end
  end

  def four_bet
    puts "Corner Bet - Please enter four numbers 0-36 you would like to bet on."
    @bets = []
    for a in 1..4 do
      puts "Enter Number #{a}:"
      @bets.push(gets.to_i)
    end
    spin_number = spin()
    if @bets.include?(spin_number)
      winner(8)
    else
      loser()
    end
  end

  def six_bet
    puts "Six-line Bet - Please enter six numbers 0-36 you would like to bet on."
    @bets = []
    for a in 1..6 do
      puts "Enter Number #{a}:"
      @bets.push(gets.to_i)
    end
    spin_number = spin()
    if @bets.include?(spin_number)
      winner(5)
    else
      loser()
    end
  end

  def color_bet
    puts "Color Bet - please enter BLACK or RED:"
    bet_color = gets.strip.downcase
    spin_color = spin_color()
    if spin_color == bet_color
      winner(1)
    else
      loser()
    end
  end

  def even_odd_bet
    puts "Even / Odd Bet - please enter EVEN or ODD:"
    bet_choice = gets.strip.downcase
    spin_result = spin().odd?
    if bet_choice == "odd"
      bet_choice = true
    else
      bet_choice = false
    end
    if bet_choice == spin_result
      winner(1)
    else
      loser()
    end
  end

  def column_bet
    puts "Column Bet - please select a column to bet on:"
    puts "1) [1,4,7,10,13,16,19,22,25,28,31,34]"
    puts "2) [2,5,8,11,14,17,20,23,26,29,32,35]"
    puts "3) [3,6,9,12,15,18,21,24,27,30,33,36]"
    user_choice = gets.to_i
    case user_choice
    when 1
      bet_arr = [1,4,7,10,13,16,19,22,25,28,31,34]
    when 2
      bet_arr = [2,5,8,11,14,17,20,23,26,29,32,35]
    when 3
      bet_arr = [3,6,9,12,15,18,21,24,27,30,33,36]
    end
    spin_number = spin()
    if bet_arr.include? spin_number
      winner(2)
    else
      loser()
    end
  end

  def dozen_bet
    puts "Dozen Bet - winner if numbers 1-12 are hit."
    spin_number = spin()
    range = (1..12).include? spin_number
    if range == true
      winner(2)
    else
      loser()
    end
  end
  
end
