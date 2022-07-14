# Game master :
function hide_number(turn=0, guess=0, target_number=0, max_number=0)
    if turn == 0
        win = 0
        clue = 0
        print("Turn : ", turn)
        print("\nPlease select the maximal number : ")
        return 
    elseif turn == 1
        target_number = rand(1:max_number)
        print("\n\nTurn : ", turn)
        print("\nPlease guess a number between 1 and ", max_number, " : ")
        win = 0
        clue = 0
        return
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
            print("\n\nTurn : ", turn)
            #print("\n\nPlease guess again a number between 1 and ", max_number, " : ")
        else
            print("\n\nCongratulation,\nYou guess correctly !")
            win = 1
            clue = 0
        end
        return win, clue, guess, target_number
    end
end

# player trying to guess the number :
function guess_number(to_test_number=[], turn=0, clue=0, previous_guess=0, win=0)
    if win == 0 
        if turn == 0
            min = 1
            max_number = rand(2:100)
            print("\nThe maximal number will be : ", max_number)

            to_test_number = collect(range(min, max_number))
            guess = 0
            return max_number, to_test_number
        elseif turn == 1
            index_guess = rand(1:length(to_test_number))
            guess = to_test_number[index_guess]
            print("\nI guess it's : ", guess)
            index = findall(x->x==guess, to_test_number)
            deleteat!(to_test_number, index)
            return guess, to_test_number
        else
            if clue == 1
                index = findall(x -> x<previous_guess, to_test_number)
                deleteat!(to_test_number, index)

                index_guess = rand(1:length(to_test_number))
                guess = to_test_number[index_guess]
                print("\nI guess it's : ", guess)
                index = findall(x -> x==guess, to_test_number)
                deleteat!(to_test_number, index)
            elseif clue == -1
                index = findall(x -> x>previous_guess, to_test_number)
                deleteat!(to_test_number, index)

                index_guess = rand(1:length(to_test_number))
                guess = to_test_number[index_guess]
                print("\nI guess it's : ", guess)
                index = findall(x->x==guess, to_test_number)
                deleteat!(to_test_number, index)
            else
                index_guess = rand(1:length(to_test_number))
                guess = to_test_number[index_guess]
                print("\nI guess it's : ", guess)
                index = findall(x -> x==guess, to_test_number)
                deleteat!(to_test_number, index)
            end
        end
    else
        print("\nI am smarter than human ^^")
        guess =0
    end
    return guess, to_test_number
end


function play()
    turn = 0
    win = 0
    guess = 0
    target_number = 1
    max_number = 100
    to_test_number = []
    while win != 1
        if turn == 0
            hide_number()
            max_number, to_test_number = guess_number()
            turn += 1
        elseif turn == 1
            hide_number(turn, guess , target_number, max_number)
            guess, to_test_number = guess_number(to_test_number, turn)
            turn += 1
        else 
            win, clue, previous_guess, target_number = hide_number(turn, guess, target_number)
            guess, to_test_number = guess_number(to_test_number, turn, clue, previous_guess, win)
            turn += 1
        end
    end
end

# tester les nombres au mileu d'abord au cas ou une "clue" arrive


