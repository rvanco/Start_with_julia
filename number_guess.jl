function play_number_guess()
    print("Please enter the maximal number : ")
    max_number = parse(Int64, readline())  
    # readline() let the player select a value
    # parse(Int64, something) change the type of something (here a string) to an Integer
    target_number = rand(1:max_number)
    # choose a rendom number between 1 and the number chose just before
    guess = 0
    # set up a guess that is false to enter the while loop

    while guess != target_number    # while the condition "guess different from target number" is true the loop continue
        print("\n\nPlease guess a number between 1 and ", max_number, " : ")
        guess = parse(Int64, readline())
        # let the player select a value and change it to an Integer

        if guess != target_number   # if the guess is different from the target the game tell it to the player
            print("Your guess is wrong, try again ;) ")
            hint = rand(1:5)
            # create a random value, if equal 1 the game give a hint to the player, here 1 in 5 chance to get a hint

            if hint == 1
                if guess < target_number # if the guess is lower than the target the game tell it
                    print("\nHint : you should seek higher number ")

                else # if the guess is higher than the target the game tell it
                    print("\nHint : you should seek lower number ")
                end
            end
        end
    end  # when "guess == target_number" the while loop end and the game is finished :
    print("\nYou guess correctly")
end
