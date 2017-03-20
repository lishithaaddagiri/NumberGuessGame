#---------
# name: NumberGuess.rb
#
#----------------
 
class Screen
 
 def cls
   puts ("\n" * 30)
   puts "\a"
 end
 
 def pause
    STDIN.gets
 end
 
end
 
class Game
    def display_greeting
        Console_Screen.cls
        print "\t\t Welcome to the Ruby Number Guessing Game!" +
        "\n\n\n\n\n\n\n\n\n\n\n\n\ Press Enter to " + 
        "continue."
 
        Console_Screen.pause
    end
 
    def display_instruction
        Console_Screen.cls
        puts "Instruction:\n\n"
 
        puts "This game randomly generates a number from 1 to 100 and "
        puts "challaenges you to identify it in as few guesses and possible "
    end
 
    def generate_number
        return randomNo = 1 + rand(1000)
    end
 
    def play_game
        number = generate_number
        numberoftries=0

        loop do
            Console_Screen.cls
            print "\nEnter your guess and press the enter key: "
 
            reply = STDIN.gets
            reply.chop!
            reply = reply.to_i
            numberoftries+=1
 
            if reply < 1 or reply > 1000 then
                print "Invalid input. Enter number b/w 1-1000"
                redo # redo the ciurrent iteration of the loop
            end
            
            if reply == number then
                Console_Screen.cls
                print "You have guessed the number! in #{numberoftries} tries, Press Enter to continue."
                Console_Screen.pause
                break
            elsif reply < number then
                Console_Screen.cls
                print "Your guess is too low! Press enter to continue."
                Console_Screen.pause
            elsif reply > number then
                Console_Screen.cls
                print "Your guess is too high! Press enter to continue."
                Console_Screen.pause
            end
 
            if numberoftries>2
                puts "Too many attempts. You have lost."
                break
            end

        end

        return numberoftries
             
    end
 
    def display_credits
        Console_Screen.cls
        puts "\t\t\Thanks you for playing the number game!!"
    end
 
    $noRight = 0
 
    Console_Screen = Screen.new
 
    SQ = Game.new
 
    SQ.display_greeting
 
    answer = ""

    loop do
        Console_Screen.cls

        print "Are you ready to play the Ruby Number Guessing Game? (y/n): "
 
        answer = STDIN.gets
 
        answer.chop!
 
        break if answer == "y" || answer == "n"
    end
 
    if answer == "n"
 
        Console_Screen.cls
 
        puts "Perhaps anoher time.\n\n"
 
    else
        SQ.display_instruction
 
        numberofgames=0;
        numoftotaltries=0;

        loop do
            numberofgames+=1;
            n = SQ.play_game
 
            numoftotaltries += n

            Console_Screen.cls

            print "You played #{numberofgames} games..."
            print "Would you like to play again? (y/n): "
 
            playAgain = STDIN.gets
            playAgain.chop!
 
            break if playAgain == "n"
            
        end
    
        avg=numoftotaltries/numberofgames;
        print "Average: #{avg}"

        SQ.display_credits
 
    end
 
end