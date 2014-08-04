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
			print "Please type in \"Quit\" to Quit: "
			userInput = gets.chomp
			puts
			@understand = true if userInput == "Quit"
		end


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
puts

if (userInput != "Yes") && userInput != "No"
	until (userInput == "Yes") || userInput == "No"
		puts
		puts "Error: Unknown Command"
		print "Please enter in \"Yes\" or \"No\": "
		userInput = gets.chomp
	end
	puts
end

case userInput
when  "Yes"
	slowText("Progress")
	puts
when "No"
	slowText("Have a good one!")
	abort
end


puts "Do you know how to play Blackjack?"
print "Please enter Yes or No: "
userInput = gets.chomp

while userInput != "Yes" && userInput != "No"
	puts 
	print "Please enter \"Yes\" or \"No\": "
	userInput = gets.chomp
end

case userInput
when "Yes"
	slowText("Progress?") # Replace
when "No"
	howToPlayBlackJack
end
	
puts
puts "Have fun and good luck!"
slowText("Dealing cards.......")



@deck.shuffle! 
@userPoints = 0
@userCards = []

2.times do
	dealtCard = @deck.first
	@userCards << dealtCard
	@deck.shift
end
puts @userCards.inspect #remove when neccesary
@userPoints += @userCards[0][2] + @userCards[1][2]
puts "Your points is " + @userPoints.to_s 

puts #remove
puts #remove when you want 


puts "Your cards:"
puts " ------------------------ "
@userCards.each do |card|
	lengthOfString = "#{card[0]} of #{card[1]}".length
	puts "|" + "#{card[0]} of #{card[1]}" + "|".rjust(25 - lengthOfString)
end
puts " ------------------------ "



=begin
print "What are you going to go?: "
userChoice = gets.chomp

if userChoice = 
=end


# use case when menu?
# when userInput
# case "A","B"
# end