
class Hlgame

  def initialize(balance)
    @balance = balance
    @cashflow = [balance]
  end

  def random_number
    @randNum = rand(9) + 1
    return @randNum
  end

  def place_bet
    cashflow = @cashflow.inject(0) {|result, element|result + element}
    puts "Your current account balance is $#{cashflow}\n"
    puts "\nPlease enter bet amount:"
    @bet_money = gets.to_f
    if @bet_money <= @balance && @balance >= cashflow
      hi_low_game()
    end
  end

  def winner(bet)
    @cashflow.push(bet)
  end

  def loser(bet)
    loss = (-bet)
    @cashflow.push(loss)
  end

  def hi_low_game
    puts "Welcome to a game of high-low."
    puts "Please enter a number (1-10) or -1 to back to menu: "
    @guessedNumber = gets.to_i
    if
      @guessedNumber == -1
      return
    else
      game()
    end
  end

  def game
    rand_num = random_number
    if @guessedNumber > rand_num then
      puts "Too high, you lose $#{sprintf("%.2f",@bet_money)}."
      loser(@bet_money)
      play_again()
    elsif @guessedNumber < rand_num then
      puts "Too low you lose $#{sprintf("%.2f",@bet_money)}."
      loser(@bet_money)
      play_again()
    else
      puts "You win $#{sprintf("%.2f",@bet_money)}!"
      winner(@bet_money)
      play_again()
    end 
  end

  def play_again
    puts "want to play again?(y/n)"
    playagain = gets.chomp!
    if playagain == "y"
      place_bet()
    else playagain ="n"
      puts "see you next time"
      return
    end
  end

end
