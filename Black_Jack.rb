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
		def blackJackCommands
			@understand = false
			help = %(
     	 ------------------------------ 			
	|  -------------------------- | 
	| | To Hit: Type in  "Hit"  | |
	| | To Stay: Type in "Stay" | |
	| | For Help: Type in "Help"| |
	| |To See cards: Type "Show"| |
	|  -------------------------- | 
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
			lengthOfUserPoints = "You:#{@userPoints}".length
			puts "Your cards:"
			puts " ------------------------ " #IDEA!: Below put user points, make box beneath(under)
			puts "|" + "You:#{@userPoints}".rjust(15) + "|".rjust(16 - lengthOfUserPoints)
			puts " ------------------------ "
			@userCards.each do |card|
				lengthOfCardName = "#{card[0]} of #{card[1]}".length
				puts "|" + "#{card[0]} of #{card[1]}" + "|".rjust(25 - lengthOfCardName)
			end
			puts " ------------------------ "
			puts
		end

		def showCPUOpponentCards
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

# Deck elements, cardType, cardSuit, 
cardLabel = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
cardSuit = ["Hearts", "Spades", "Clubs", "Diamonds"]
@deck = []

# Makes deck
cardLabel.each do |label|
	cardSuit.each do |suit|
		@deck.push([label, suit])
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
	puts
	abort
end


slowText("Do you know how to play Blackjack?")
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
	blackJackCommands
	slowText("Progress 100%")
	puts
end
	
puts "Have fun and good luck!"
slowText("Dealing cards.......")
puts "#{puts} #{puts}"



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


2.times do
	
	dealtCard = @deck.first
	
	if dealtCard.size == 4

		puts "You was dealt an #{dealtCard[0]} of #{dealtCard[1]}!"
		print "What value would you like to make it? Enter in 1 or 11: "
		userInput = gets.chomp
		puts "#{puts}"

		until userInput == "1" || userInput == "11"
			if userInput == "Show"
				showUserCards
				print "Please enter 1 or 11: "
				userInput = gets.chomp
				puts
			elsif userInput == "Help" 
 				blackJackCommands
				print "Please enter 1 or 11: "
				userInput = gets.chomp
				puts
			else
				puts "Error: Unknown Command"
				print "Please enter 1 or 11: "
				userInput = gets.chomp
				puts
			end
		end

		if userInput == "1"
			puts
			dealtCard.delete(11) 
		else
			puts
			dealtCard.delete(1)
		end
	else
		if dealtCard[0] == "8"
			puts "You was dealt an #{dealtCard[0]}!"
		else
			puts "You was dealt a #{dealtCard[0]}!"
		end
	end

	@userPoints += dealtCard[2]
	@userCards << dealtCard
	@deck.shift

end

puts
puts "Your Points: #{@userPoints}"
puts "#{puts}"

if @cpuOpponentPoints == 21 && @userPoints == 21		
	puts "It's a tie. How rare is this!!"
	puts
	showCPUOpponentCards
	showUserCards
	abort
end

if @cpuOpponentPoints == 21 && @userPoints != 21
	puts "You lose! Good Game."
	puts
	showCPUOpponentCards
	showUserCards
	abort
end

if @userPoints == 21 && @cpuOpponentPoints != 21
	puts "Congratulations! You win!"
	puts
	showCPUOpponentCards
	showUserCards
	abort
end



loop do
	unless @cpuOpponentPoints >= 17 then
		1.times do
			if @cpuOpponentPoints == 21
				break
			elsif @cpuOpponentPoints >= 17 
				break
			elsif @cpuOpponentPoints > 21 
				break
			else 
				nil
			end

			dealtCard = @deck.first

			if dealtCard.size == 4
				if @cpuOpponentPoints + dealtCard[3] > 21 
					dealtCard.delete(11)
					# @cpuOpponentPoints += dealtCard[2]
				else
					dealtCard.delete(1)
					# @cpuOpponentPoints += dealtCard[3]
				end
			end

			@cpuOpponentPoints += dealtCard[2]
			@cpuOpponentCards << dealtCard
			@deck.shift
		end
	end


	1.times do
		print "What would you like to do?: "
		userInput = gets.chomp 
		@loopBreaker = userInput
		puts

		until userInput == "Hit" || userInput == "Stay" || userInput == "Show" || userInput == "Help"
			puts "Error: Unknown Command"
			print "Please enter \"Hit\" or \"Stay\": "
			userInput = gets.chomp
			puts 
		end 

		case
		when userInput == "Hit"

			dealtCard = @deck.first

			if dealtCard.size == 4
				puts
				puts "You was dealt an #{dealtCard[0]} of #{dealtCard[1]}!"
				print "What value would you like to make it? Enter in 1 or 11: "
				userInput = gets.chomp
				puts

				until userInput == "1" || userInput == "11"
					puts "Error: Unknown Command"
					print "Please enter \"1\" or \"11\": "
					@userInput = gets.chomp
					puts
				end

				if userInput == "1"
					puts
					dealtCard.delete(11) 
				else
					puts
					dealtCard.delete(1)
				end
			else
				if dealtCard[0] == "8"
					puts
					puts "You was dealt an #{dealtCard[0]}!"
				else
					puts
					puts "You was dealt a #{dealtCard[0]}!"
				end
			end

			@userPoints += dealtCard[2]		
			@userCards << dealtCard
			puts
			puts "Your Points: #{@userPoints}"
			puts
			puts
			@deck.shift

		when userInput == "Show"
			showUserCards
		when userInput == "Help"
			blackJackCommands
		end
	end
	break if @loopBreaker == "Stay"
end

=begin

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