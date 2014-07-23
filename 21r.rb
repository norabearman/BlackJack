# Define variables and methods here
# For human
user_cards = 0
card_one = rand(1..11)
card_two = rand(1..11)
# instance variable???

# For computer
cpu_cards = rand(1..11) 
cpu_card = rand(1..11)

while cpu_cards < 16
	cpu_cards += rand(1..11)
end

def commands
	key_commands = %(
	Enter h to recieve a random number card value.
	Enter s to stay with your current number card value.
	Enter help to see the rules again.
	Enter xhelp for elaboration on the rules.
	Enter commands to see this commands again.
	)
	puts "#{key_commands}"
end

def help
	begin
		puts 
		key_help = %(
		21 is a card game.
		It is the most widely played casino banking game in the world.
		Your opponent will be the computer.
		The game is very simple to play, here's how you play.

		Try to get a number card value to as close to 21 as you can.
		Anything beyond 21 is an automatic loss.
		If you get a number card value of 21, you automatically win.
		)
		puts "#{key_help}"
	end 
end 

def xhelp
	x_help = %(
	You have two objectives:
	Get more points then your opponent(computer).
	Get the highest card value possible without going over blackjack.

	Your opponent is the computer.
	If you get 21 points before cpu then you automatically win.
	If you have a number card value less than computer then cpu wins.
	However, you want to avoid going over 21 or you lose.
	To get any amount of cards, you need to make a selection.
	-----------------------------------------------------------------------
	There are two selections that are made in 21
	Hit and Stay

	About Hit:
	-----------------------------------------------------------------------
	- To select hit, enter in h.
	- Hit will add a random number card value 1 - 11 
	to your existing amount of points.
	- WARNING!: If it is used to often then,
	you might go over 21 and lose the game.
	-In order to avoid losing the game, 
	you would choose a different selection (stay).
	
	About Stay:
	-----------------------------------------------------------------------
	- To select stay, enter in s.
	- Stay will not to add any more points to your existing amount of points.
	- You would select stay if you are confident with the amount of points
	you possess that wont go over blackjack.
	- This selection cannot be undone so think twice before 
	making this decision.
	)
puts "#{x_help}"
end

# First: Have computer ask if we want to play a game
puts "~Blackjack~"
puts 
puts "Welcome to 21, would you like to play?"
print "(Y/N): "
user_input = gets.chomp
                       
if (user_input != "Y") && (user_input != "N")
	begin
		puts 
		puts "What was your answer, I didn't catch that."
		print "Please enter in either 'Y'(Yes) or 'N'(No): "
		user_input = gets.chomp
	end while (user_input != "Y") && (user_input != "N")
end

if user_input == "Y"
	puts 
	puts "Progress: 1/3"
	puts 
end

if user_input == "N"
	puts 
	puts "Have a nice day!"
	abort
end

# Second: Have the computer ask if we know how to play
	# If not, have the computer explain the rules

puts "Do you know how to play 21?"
print "(Y/N): "
user_input = gets.chomp

if (user_input != "Y") && (user_input != "N") 
	begin
		puts 
		puts "What was your answer, I didn't catch that."
		print "Please enter in either 'Y'(Yes) or 'N'(No): "
		user_input = gets.chomp
	end while (user_input != "Y") && (user_input != "N")
end

if user_input == "N"
	help
	puts "Please enter the text below when you're ready."
	puts '- - -> "I got it"'
	user_input = gets.chomp
	if user_input != "I got it"
		begin
			puts
			puts "I am sorry, please enter in the text when you're ready."
			puts '- - -> "I got it"'
			user_input = gets.chomp
		end	while user_input != "I got it"
		puts
		puts "Progress: 2/3"
		puts
	else user_input == "I got it"
		puts
		puts "Progress: 2/3"
		puts
	end
else user_input == "Y"
	puts
	puts "Progress: 2/3"
	puts
end

puts "Do you know the commands of this game to play 21?"
print "(Y/N): "
user_input = gets.chomp

if (user_input != "Y") && (user_input != "N") 
	begin
		puts 
		puts "What was your answer, I didn't catch that."
		print "Please enter in either 'Y'(Yes) or 'N'(No): "
		user_input = gets.chomp
	end while (user_input != "Y") && (user_input != "N")
end

if user_input == "N"
	commands
	puts "Please enter the text below when you're ready"
	puts '- - -> "I got it"'
	user_input = gets.chomp 
	puts
	if user_input != "I got it"
		begin
			puts "I am sorry, please enter in the text when you're ready."
			puts '- - -> "I got it"'
			user_input = gets.chomp
			puts
		end	while user_input != "I got it"
			puts "Progress: 3/3"
			puts
			puts "Great, lets get started!"
			puts "*Dealing cards*"
			sleep 2
	else user_input == "I got it"
		puts 
		puts "Progress: 3/3"
		puts
		puts "Great, lets get started!"
		puts "*Dealing cards*"
		sleep 2
	end
else user_input == "Y"
	puts 
	puts "Progress: 3/3"
	puts 
	puts "Great, lets get started!"
	puts "*Dealing cards*"
	sleep 2
end

# Third: The user would receive 2 cards
# Display what cards equal to the user_cards 
# Check if user_cards is equal to bust or blackjack

user_cards = card_one + card_two
puts 
puts user_cards 
puts 

# Fourth: The computer would ask user to hit or stay
begin 
	if user_cards == 21
		sleep 2
		puts "Blackjack!"
		sleep 3
		puts 
		puts "Congratulations! You win!"
		puts 
		puts "You: #{user_cards} Computer: #{cpu_cards}"
		abort
	elsif user_cards > 21
		sleep 2
		puts "Bust!"
		sleep 3
		puts 
		puts "Computer wins"
		puts 
		puts "You: #{user_cards} Computer: #{cpu_cards}"
		abort	
	else 
		nil
	end

	print "What would you like to do?: "
	user_input = gets.chomp
	puts

	if user_input != "xhelp" && user_input != "commands" && user_input != "help" && user_input != "h" && user_input != "s"
		begin
			puts "Unknown Command"
			print "Please enter in a command: "
			user_input = gets.chomp
			puts
		end while user_input != "xhelp" && user_input != "commands" && user_input != "help" && user_input != "h" && user_input != "s"
	end

	case user_input
	when "xhelp"
		xhelp
	when "help"
		help
	when "commands"
	 	commands
	when "h"
		puts "*Deals a card*"
		sleep 1.5
		puts 
		user_cards += rand(1..11)
		puts "#{user_cards}"
		puts ""
	end

end while user_input == "h" || user_input == "commands" || user_input == "xhelp" || user_input == "help"

puts "You have chosen to stay with #{user_cards}."
puts 
puts 
sleep 4
puts "You: #{user_cards} Computer: #{cpu_cards}"
puts 

# Fifth: Computer will compare user_cards and cpu_cards
if cpu_cards == user_cards
	puts 
	puts "It is a tie!"
	puts "How rare is that!"
	sleep 2
	puts "Computer: #{cpu_cards} You: #{user_cards}"
	abort
end

if cpu_cards && user_cards > 21 
	puts 
	puts "No one is a winner."
	sleep 4
	puts "Computer: #{cpu_cards} You: #{user_cards}"
	abort
end

if cpu_cards < user_cards && user_cards <= 21
	puts 
	puts "Congratulations! You win!"
	sleep 2
	puts "Computer: #{cpu_cards} You: #{user_cards}"
	abort
end

if cpu_cards <= 21 && cpu_cards > user_cards
	puts 
	sleep 3
	puts "Computer wins"
	puts "Computer: #{cpu_cards} You: #{user_cards}"
	abort
end

if cpu_cards > 21 && user_cards < 21
	puts 
	puts "Congratulations! You win!"
	sleep 2
	puts "Computer: #{cpu_cards} You: #{user_cards}"
	abort
end
# Ideas
	# Make money
	# Make this a class?
	# Experimentation in 21rr.rb, Make the game into a class?

