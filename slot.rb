<<<<<<< HEAD
class slot
def slot_multiplier(s1, s2, s3)
  if s1==s2 && s2==s3
    3
  elsif s1==s2 || s2==s3 || s1==s3
    2
  else
    0
  end
end
=======
>>>>>>> d6e28ddc0714c4de264d45d82af4626d97aa0ff0

class Slots
  
  def initialize
  @cashflow = []
  end

  def slot_multiplier(s1, s2, s3)
    if s1==s2 && s2==s3
      3
    elsif s1==s2 || s2==s3 || s1==s3
      2
    else
      0
    end
  end
  
  def run_slots
    @slot_list = %w[Bar Bell Cherry Lemon Grapes Bell Melon]
  
    puts "----------------------"
    puts "Welcome to Ruby Slots"
    puts "----------------------"
    loop do
      puts "How much would you like to bet?"
      bet = gets.to_f
      puts "Type any key to pull slot lever"
      lever = gets.strip
      puts "~~~~~~~~~~~~~~~~~~~~~~~"
      slot1 = @slot_list.sample
      slot2 = @slot_list.sample
      slot3 = @slot_list.sample
      puts "#{slot1} - #{slot2} - #{slot3}"
      puts "~~~~~~~~~~~~~~~~~~~~~~~\n"
      winnings = bet * slot_multiplier(slot1, slot2, slot3)
      if winnings == 0
        winnings = (winnings - bet)
        puts "You have lost $#{winnings}"
        @cashflow.push(winnings)
      else
        winnings = (winnings + bet)
        puts "You have won $#{winnings}"
        @cashflow.push(winnings)
      end

      print "Would you like roll again? Type yes or no\n"
      unless gets.chomp=="yes"
        
        total_winnings = @cashflow.inject(0) {|result, element|result + element}  
      puts "\nYou have ended Ruby Slots with $#{total_winnings}\n"
      return total_winnings
      
      
      end
    end
  end
end
 