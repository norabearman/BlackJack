puts "Welcome to win or lose"
puts 

class WinOrLoseGame
	begin
		faith = rand(1..2)

		case faith
		when 1
			puts "You win."
			puts 
		when 2 
			puts "You lose."
			puts 
		end

		puts "Would you like to play again?"
		puts "Please enter in either 'Y' or 'N'"
		puts 
		user_input = gets.chomp

		case user_input 
		when 'Y'
			WinOrLoseGame.new
			puts 
		when 'N'
			abort
		end
	end while user_input == "Y"
end
