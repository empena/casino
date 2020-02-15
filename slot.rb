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
    puts "You have won $#{winnings}"
    
    # add winnings to bankroll

    print "Would you like roll again? Type yes or no"
    unless gets.chomp=="yes"
      puts "You have ended Ruby Slots with $#{sum_bankroll}"
    break

    # go back to menu
    
    end
  end
end

run_slots
