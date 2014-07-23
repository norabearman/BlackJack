# Black Jack game by Julius Osagiede 

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
@deck[32..47].each do |face_card|
	face_card.push(10)
end


# Method that puts index of each deck array object starting at 1
@counter = 0
def card_indexes
	@deck.each do |card|
		@counter += 1
		puts @counter.to_s + " - " + card.to_s 
		puts
	end
end

# Greeting text 
%(
#{print "Welcome to".rjust(103)}
	 -------------------	
	| B l a c k j a c k |
	 -------------------	
).each_char { |letter| 
sleep 0.050
print letter
}
puts
"Welcome to Blackjack, would you like to play?".each_char { |letter| 	
sleep 0.050
print letter }
puts
puts "Please enter Yes or No"
























# @deck[32..47].each { |card| puts card.inspect}







=begin
puts cards_with_value_of_10
puts 
puts @deck
=end



