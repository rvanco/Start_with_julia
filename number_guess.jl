function play_number_guess()
    total_number = 25
    target_number = rand(1:total_number)

    guess = 0

    while guess != target_number
        print("Please guess a number between 1 and ", total_number, " : ")
        guess = parse(Int64, readline())
        if guess != target_number
            print("\n")
            print("Your guess is wrong, try again ;) \n")
        end
    end
    print("\n")
    print("You guess correctly")
end
