# Game master :
function hide_number(max_number=0, turn=0, guess=0, target_number=0)
    if turn == 0
        win = 0
        clue = 0
        print("\nPlease select the maximal number : ")
    elseif turn == 1
        target_number = rand(1:max_number)
        print("\nPlease guess a number between 1 and ", max_number, " : ")
        win = 0
        clue = 0
    else
        if guess != target_number
            print("\nYour guess is wrong, try again ;)")
            win = 0
            clue = 0
            hint = rand(1:5)
            if hint == 1
                if guess < target_number
                    print("\nHint : you should seek higher number")
                    clue = 1
                else
                    print("\nHint : you should seek lower number")
                    clue = -1
                end
            end
            #print("\n\nPlease guess again a number between 1 and ", max_number, " : ")
        else
            print("\n\nCongratulation,\nYou guess correctly !")
            win = 1
            clue = 0
        end
    end
    return win, clue, guess, target_number
end

# player trying to guess the number :
function guess_number(turn=0, clue=0, min=0, max=0, previous_guess=0, max_number=0, win=0)
    if win == 0 
        if turn == 0
            max_number = rand(2:100)
            print("\nThe maximal number will be : ", max_number)
            min = 1
            max = max_number
            guess = 0
        elseif turn == 1
            guess = rand(min:max)
            print("\nI guess it's : ", guess)
            max_number = max_number
            min = min
            max = max
        else
            if clue == 1
                min = previous_guess
                guess = rand(min:max)
                print("\nI guess it's : ", guess)
            elseif clue == -1
                max = previous_guess
                guess = rand(min:max)
                print("\nI guess it's : ", guess)
            else
                guess = rand(min:max)
                print("\nI guess it's : ", guess)
            end
        end
    else
        print("\nI am smarter than human ^^")
        guess =0
    end
    return max_number, guess, min, max
end


function play()
    turn = 0
    win = 0
    max_number = 0
    guess = 0
    target_number = 1
    min = 0
    max = 1
    while win != 1 #&& turn < 5
        print("\n\nTurn : ", turn)
        win, clue, previous_guess, target_number = hide_number(max_number, turn, guess, target_number)
        max_number, guess, min, max = guess_number(turn, clue, min, max, previous_guess, max_number, win)
        turn += 1
    end
end