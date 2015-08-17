# set up the hangman parts
# set up the alphabet
# set up an empty hangman
# welcome the player and save their name
# choose a random word convert it to an array of it's letters
# set up an array to hold the letters the player chooses
# save a string to be used as the placeholder for hangman parts
# save a string to be used as the placeholder for letters in player's word
# put a placeholder in each spot for the letters player needs to guess
# put a placeholder for each part of the hangman

# as long as one or more of the parts of the hangman needs to be placed, we'll allow the 
# player to continue guessing letters 
  # display the current state of the hangman
  # display the current state of the player's word
  # prompt the player to pick a letter from the remaning letters, and show them the remaning letters
  # get a letter from the player
  # if the letter they chose is not in the remaning letters ask the player to choose again
  # from the remaning letters

  #### SUCCESS ####
  # if the letter the player choose is in the game word
    # find the location(s) of the letter 
    # replace the placeholder with the letter in the player's word
    # remove the letter from the alphabet so they can't pick it again
    #clear the screen
    # let the player know they choose a letter that's in the game word
  #### FAIL ####
  # if the letter they choose is not in the game word
    # delete it from the alphabet
    # remove the first hangman part placeholder
    # add the part to the end of the hangman
    # clear the screen
    # let the player know the letter is not in the game word

  #### WIN CASE ####
  # if the player figures out the game word
    # check that the player word has no more underscores
    # congratulate the player
    # show the hangman
    # show the word
    # exit the program

  #### LOSE CASE ####
  # if the player runs out of chances
    # check that there are no more placeholders left for the hangman
    # let them know they lost
    # show the hangman
    # show the current player word 
    # show the game word
    # exit the program
