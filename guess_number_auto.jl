function hide_number(max_number=2, turn=0, guess=0, target_number=0)
    if turn == 0
        win = 0
        print("Please enter the maximal number : ")
    elseif turn == 1
        target_number = rand(1:max_number)
        print("\n\nPlease guess a number between 1 and ", max_number, " : ")
    else
        if guess != target_number
            print("Your guess is wrong, try again ;) ")
            win = 0
            clue = 0
            hint = rand(1:5)
            if hint == 1
                if guess < target_number
                    print("\nHint : you should seek higher number ")
                    clue = 1
                else
                    print("\nHint : you should seek lower number ")
                    clue = -1
                end
            end
            print("\n\nPlease guess again a number between 1 and ", max_number, " : ")
        else
            print("\nYou guess correctly")
            win = 1
        end
    end
    return win, clue, guess, target_number
end


function guess_number(turn=0, clue=0, min=0, max=0)
    if turn == 0
        max_number = rand(2:100)
        print("\nThe maximal number is : ", max_number)
        min = 1
        max = max_number
    elseif turn == 1
        guess = rand(min:max)
        min = 1
        max = max_number
    else
        if clue == 1
            min = previous_guess
            guess = rand(min:max)
        elseif clue == -1
            max = previous_guess
            guess = rand(min:max)
        else
            rand(min:max)
        end
    end
    return max_number, guess, min, max
end