# Black Jack game by Julius Osagiede 

#=================================================================================#
#=================================== METHODS =====================================# 
#=================================== vvvvvvv =====================================#
#=================================================================================#

		# Method that slows down text by 1/20 of a second
		def slowText(statement)
			statement.each_char { |letter|
				sleep 0.050
				print letter
			}
			puts 
		end
		

		# Method that outputs the index of each deck array object starting at 1
		def cardIndexes
			@counter = 0
			@deck.each do |card|
				@counter += 1
				puts @counter.to_s + " - " + card.to_s 
			end
		end


		# Method that outputs information text
		def howToPlayBlackJack
			@understand = false
			help = %(
     	 ------------------------------ 			
	|  --------------------------  | 
	| | For Hit: Type in 'Hit'   | |
	| | For Stay: Type in 'Stay' | |
	| | For Help: Type in 'Help' | | 
	|  --------------------------  | 
	 ------------------------------
 		)
		puts help
		puts

		while @understand == false
			print "Please type in \"Quit\" to quit help: "
			userInput = gets.chomp
			puts
			@understand = true if userInput == "Quit"
		end

		end

		def showUserCards # Displays user cards respectively
			lengthUserPoints = "You:#{@userPoints}".length
			puts "Your cards:"
			puts " ------------------------ " #IDEA!: Below put user points, make box beneath(under)
			puts "|" + "You:#{@userPoints}".rjust(15) + "|".rjust(16 - lengthUserPoints)
			puts " ------------------------ "
			@userCards.each do |card|
				lengthOfCardName = "#{card[0]} of #{card[1]}".length
				puts "|" + "#{card[0]} of #{card[1]}" + "|".rjust(25 - lengthOfCardName)
			end
			puts " ------------------------ "
			puts
		end

		def showCPUOpponentCards # Use when game is over!!!! New Method
			lengthOfCPUPoints = "CPU: #{@cpuOpponentPoints}".length
			puts "Computer's cards:"
			puts " ------------------------ " #IDEA!: Below put user points, make box beneath(under)
			puts "|" + "CPU:#{@cpuOpponentPoints}".rjust(15) + "|".rjust(17 - lengthOfCPUPoints)
			puts " ------------------------ "
			@cpuOpponentCards.each do |card|
				lengthOfCardName = "#{card[0]} of #{card[1]}".length
				puts "|" + "#{card[0]} of #{card[1]}" + "|".rjust(25 - lengthOfCardName)
			end
			puts " ------------------------ "
			puts

		end
		
#=================================================================================#
#=================================== ^^^^^^^ =====================================#
#=================================== METHODS =====================================# 
#=================================================================================#

# Makes deck
card_type = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
card_suit = ["Hearts", "Spades", "Clubs", "Diamonds"]
@deck = []

card_type.each do |type|
	card_suit.each do |suit|
			@deck.push([type, suit])
	end
end


# Gives all aces two values of 1 or 11
@deck[48..51].each do |ace|
	ace.push(1).push(11)
end

# Gives all twos a value of 2
@deck[0..3].each do |two|
	two.push(2)
end

# Gives all threes a value of 3
@deck[4..7].each do |three|
	three.push(3)
end

# Gives all fours a value of 4
@deck[8..11].each do |four|
	four.push(4)
end

# Gives all fives a value of 5
@deck[12..15].each do |five|
	five.push(5)
end

# Gives all sixs a value of 6
@deck[16..19].each do |six|
	six.push(6)
end

# Gives all sevens a value of 7
@deck[20..23].each do |seven|
	seven.push(7)
end

# Gives all eights a value of 8
@deck[24..27].each do |eight|
	eight.push(8)
end

# Gives all nines a value of 9
@deck[28..31].each do |nine|
	nine.push(9)
end

# Gives all face cards (J,Q,K) values of 10
@deck[32..47].each do |faceCard|
	faceCard.push(10)
end


=begin
# Greeting text 
welcomeBlackJack = %(

	 -------------------	
	| B l a c k j a c k |
	 -------------------	
)

slowText(welcomeBlackJack)

slowText("Welcome to Blackjack, would you like to play?")
print "Please enter Yes or No: "
userInput = gets.chomp

if (userInput != "Yes") && userInput != "No"
	until (userInput == "Yes") || userInput == "No"
		puts
		puts "Error: Unknown Command"
		print "Please enter in \"Yes\" or \"No\": "
		userInput = gets.chomp
	end
end

case userInput
when  "Yes"
	puts
	slowText("Progress 50%")
	puts
when "No"
	puts
	slowText("Have a good one!")
	abort
end


puts "Do you know how to play Blackjack?"
print "Please enter Yes or No: "
userInput = gets.chomp

while userInput != "Yes" && userInput != "No"
	puts 
	puts "Error: Unknown Command" 
	print "Please enter \"Yes\" or \"No\": "
	userInput = gets.chomp
end

case userInput
when "Yes"
	puts
	slowText("Progress 100%") 
	puts
when "No"
	puts
	howToPlayBlackJack
	slowText("Progress 100%")
	puts
end
	
puts "Have fun and good luck!"
slowText("Dealing cards.......")
puts
=end


@deck.shuffle! 
@blackJack = %(
		  	    -----------
		  	   | Blackjack |
		  	    -----------
			  )

@cpuOpponentPoints = 0
@cpuOpponentCards = []

@userPoints = 0
@userCards = []

2.times do
	dealtCard = @deck.first 

	if dealtCard.size == 4
		if @cpuOpponentPoints + dealtCard[3] <= 21
			@cpuOpponentPoints += dealtCard[3]
			@cpuOpponentCards << dealtCard
			@deck.shift
			next
		else @cpuOpponentPoints + dealtCard[2] <= 21
			@cpuOpponentPoints += dealtCard[2]
			@cpuOpponentCards << dealtCard
			@deck.shift
			next
		end
	end

	@cpuOpponentPoints += dealtCard[2]
	@cpuOpponentCards << dealtCard
	@deck.shift

end
puts "Computer's first two cards add up to " + @cpuOpponentPoints.to_s

2.times do
	dealtCard = @deck.first
	
	if dealtCard.size == 4
		
		unless @userCards[0] == nil
			showUserCards
		end

		puts "You've received an #{dealtCard[0]} of #{dealtCard[1]}"
		print "What value would you like to make it? Enter in 1 or 11: "
		userInput = gets.chomp
		puts

		until userInput == "1" || userInput == "11"
			puts
			puts "Error: Unknown Command"
			print "Please enter 1 or 11: "
			userInput = gets.chomp
		end

		if userInput == "1"
			dealtCard.delete(11) 
		else
			dealtCard.delete(1)
		end

	end

	@userPoints += dealtCard[2]
	@userCards << dealtCard
	@deck.shift

end

if @cpuOpponentPoints == 21 && @userPoints == 21		
	puts "It's a tie. How rare is this!!"
	showCPUOpponentCards
	showUserCards
	abort
end

if @cpuOpponentPoints == 21 && @userPoints != 21
	puts "You lose! Good Game."
	showCPUOpponentCards
	showUserCards
	abort
end

if @userPoints == 21 && @cpuOpponentPoints != 21
	puts "Congratulations! You win!"
	showCPUOpponentCards
	showUserCards
	abort
end

puts "Your first two cards add up to " + @userPoints.to_s # Remove when necessary 8/16/14 11:25 PM



=begin
2.times do
	dealtCard = @deck.first

	if dealtCard.size == 4
		if @cpuOpponentPoints + dealtCard[3] > 21 
			dealtCard.delete(11)
			@cpuOpponentPoints += dealtCard[2]
		elsif @cpuOpponentPoints + dealtCard[2] > 21
			dealtCard.delete(1)
			@cpuOpponentPoints += dealtCard[3]
		else 
			nil
		end
	end

	@cpuOpponentPoints += dealtCard[2]
	@cpuOpponentCards << dealtCard
	@deck.shift

	if @cpuOpponentPoints == 21
		break
	end
end

loop do
	dealtCard = @deck.first

	if @cpuOpponentPoints == 21
		break
	elsif @cpuOpponentPoints >= 17 # Stop hitting equal or over 17
		break
	elsif @cpuOpponentPoints > 21 
		break
	else 
		nil
	end

	 if dealtCard.size == 4
		if @cpuOpponentPoints + dealtCard[3] > 21 
			dealtCard.delete(11)
			@cpuOpponentPoints += dealtCard[2]
		else
			dealtCard.delete(1)
			@cpuOpponentPoints += dealtCard[3]
		end
	end

	@cpuOpponentPoints += dealtCard[2]
	@cpuOpponentCards << dealtCard
	@deck.shift
	
end
# Work on this for computer before doing anything else!!!!!~




2.times do
	dealtCard = @deck.first

	if @userPoints == 21 && @cpuOpponentPoints == 21 # Not so Solid Blackjack, tie
		slowText(@blackJack)
		sleep 2.5
		puts "It's a tie. How rare is this!!"
		showCPUOpponentCards
		showUserCards
		abort
	elsif @userPoints > 21 && @cpuOpponentPoints > 21 # 21, both busted, Draw
		slowText("Bust!")
		sleep 2.5
		puts "It's a draw. How rare is this!!" 
		showCPUOpponentCards
		showUserCards
		abort
	elsif @userPoints == 21 && @cpuOpponentPoints < 21  || @userPoints == 21 && @cpuOpponentPoints > 21# Solid Blackjack, User wins
		slowText(@blackJack)
		sleep 2.5
		puts "Congratulations, You win!"
		showCPUOpponentCards
		showUserCards
		abort
	elsif @cpuOpponentPoints == 21 && @userPoints < 21 || @cpuOpponentPoints == 21 && @userPoints > 21 # Computer got Blackjack frst
		slowText(@blackJack)
		sleep 2.5
		puts "You lose, Good Game!" 
		showCPUOpponentCards
		showUserCards
		abort
	elsif @userPoints < 21 and @cpuOpponentPoints < 21 && @userPoints > @cpuOpponentPoints # user wins, more points than CPU < 21
		slowText(@blackJack)
		sleep 2.5
		puts "You lose, Good Game!" 
		showCPUOpponentCards
		showUserCards
		abort
	elsif @cpuOpponentPoints < 21 and @userPoints < 21 && @cpuOpponentPoints > @userPoints # CPU wins, more points than user < 21
		slowText(@blackJack)
		sleep 2.5
		puts "You lose, Good Game!" 
		showCPUOpponentCards
		showUserCards
		abort
	else 
		nil
	end


	if dealtCard.size == 4
		showUserCards
		puts "You've received an #{dealtCard[0]} of #{dealtCard[1]}"
		print "What value would you like to make it? Enter in 1 or 11: "
		userInput = gets.chomp
		puts

		until userInput == "1" || userInput == "11"
			puts
			puts "Error: Unknown Command"
			print "Please enter 1 or 11: "
			userInput = gets.chomp
		end

		if userInput == "1"
			dealtCard.delete(11) 
		else
			dealtCard.delete(1)
		end

	end

	break if @userPoints == 21
	@userPoints += dealtCard[2]
	@userCards << dealtCard
	@deck.shift
end	
showUserCards


loop do


	if @userPoints == 21 && @cpuOpponentPoints == 21 # Not so Solid Blackjack, tie
		slowText(@blackJack)
		sleep 2.5
		puts "It's a tie. How rare is this!!"
		showCPUOpponentCards
		showUserCards
		abort
	elsif @userPoints > 21 && @cpuOpponentPoints > 21 # 21, both busted, Draw
		slowText("Bust!")
		sleep 2.5
		puts "It's a draw. How rare is this!!" 
		showCPUOpponentCards
		showUserCards
		abort
	elsif @userPoints == 21 && @cpuOpponentPoints < 21  || @userPoints == 21 && @cpuOpponentPoints > 21# Solid Blackjack, User wins
		slowText(@blackJack)
		sleep 2.5
		puts "Congratulations, You win!"
		showCPUOpponentCards
		showUserCards
		abort
	elsif @cpuOpponentPoints == 21 && @userPoints < 21 || @cpuOpponentPoints == 21 && @userPoints > 21 # Computer got Blackjack frst
		slowText(@blackJack)
		sleep 2.5
		puts "You lose, Good Game!" 
		showCPUOpponentCards
		showUserCards
		abort
	elsif @userPoints < 21 and @cpuOpponentPoints < 21 && @userPoints > @cpuOpponentPoints # user wins, more points than CPU < 21
		slowText(@blackJack)
		sleep 2.5
		puts "You lose, Good Game!" 
		showCPUOpponentCards
		showUserCards
		abort
	elsif @cpuOpponentPoints < 21 and @userPoints < 21 && @cpuOpponentPoints > @userPoints # CPU wins, more points than user < 21
		slowText(@blackJack)
		sleep 2.5
		puts "You lose, Good Game!" 
		showCPUOpponentCards
		showUserCards
		abort
	else 
		nil
	end

	print "What would you like to do?: "
	userInput = gets.chomp 
	puts

	until userInput == "Hit" || userInput == "Stay"
		puts "Error: Unknown Command"
		print "Please enter \"Hit\" or \"Stay\": "
		userInput = gets.chomp
		puts
	end 

	if userInput == "Hit"
		dealtCard = @deck.first

		if dealtCard.size == 4
			puts "You've received an #{dealtCard[0]} of #{dealtCard[1]}"
			print "What value would you like to make it? Enter in 1 or 11: "
			userInput = gets.chomp
			if userInput == "1"
				dealtCard.delete(11) 
			else
				dealtCard.delete(1)
			end

		end

		@userPoints += dealtCard[2]		
		@userCards << dealtCard
		@deck.shift
		showUserCards

	end

	break if userInput == "Stay"
end

















	if @userPoints == 21 && @cpuOpponentPoints == 21 # Not so Solid Blackjack, tie
		slowText(@blackJack)
		sleep 2.5
		puts "It's a tie. How rare is this!!"
		showCPUOpponentCards
		showUserCards
		abort
	elsif @userPoints > 21 && @cpuOpponentPoints > 21 # 21, both busted, Draw
		slowText("Bust!")
		sleep 2.5
		puts "It's a draw. How rare is this!!" 
		showCPUOpponentCards
		showUserCards
		abort
	elsif @userPoints == 21 && @cpuOpponentPoints < 21  || @userPoints == 21 && @cpuOpponentPoints > 21# Solid Blackjack, User wins
		slowText(@blackJack)
		sleep 2.5
		puts "Congratulations, You win!"
		showCPUOpponentCards
		showUserCards
		abort
	elsif @cpuOpponentPoints == 21 && @userPoints < 21 || @cpuOpponentPoints == 21 && @userPoints > 21 # Computer got Blackjack frst
		slowText(@blackJack)
		sleep 2.5
		puts "You lose, Good Game!" 
		showCPUOpponentCards
		showUserCards
		abort
	elsif @userPoints < 21 and @cpuOpponentPoints < 21 && @userPoints > @cpuOpponentPoints # user wins, more points than CPU < 21
		slowText(@blackJack)
		sleep 2.5
		puts "You lose, Good Game!" 
		showCPUOpponentCards
		showUserCards
		abort
	elsif @cpuOpponentPoints < 21 and @userPoints < 21 && @cpuOpponentPoints > @userPoints # CPU wins, more points than user < 21
		slowText(@blackJack)
		sleep 2.5
		puts "You lose, Good Game!" 
		showCPUOpponentCards
		showUserCards
		abort
	else 
		nil
	end
=end





#BEGAN COMPARISON TEXT 