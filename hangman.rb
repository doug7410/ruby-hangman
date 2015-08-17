require 'random-word'
require 'pry'

# set up the hangman parts
hangman_parts = [
  'head',
  'torso',
  'butt',
  'hat',
  'right leg',
  'left leg',
  'right arm','left arm','nose'
]

# set up the alphabet
alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

# set up the available words for the game
# words = ['joker','teddybear','soda', 'onion', 'tuna', 'sandwich', 'rafting', 'fishing']

# set up an empty hangman
hangman = []

# welcome the player and save their name
system "cls"
puts "Hello, welcome to hangman!! \n\n"
puts "What's your name?"
name = gets.chomp
system "cls"
puts "Ok " + name + ". Let's play."

# choose a word from the list of game words and convert it to an array of it's letters
game_word_letters = RandomWord.nouns.next.split('_').first.chars

# set up an array to hold the letters the player chooses
player_word_letters = []

hangman_placeholder = '*****' #save a string to be used as the placeholder for hangman parts
player_word_letters_placeholder = '_' #save a string to be used as the placeholder for letters in player's word

# put a placeholder in each spot for the letters player needs to guess
game_word_letters.each do |letter|
  player_word_letters << player_word_letters_placeholder
end

# put a placeholder for each part of the hangman
hangman_parts.each do |part|
  hangman << hangman_placeholder
end

# show the current state of the hangman
def show_hangman(hangman)
  puts "\n\n:::Hangman:::" 
  puts hangman
end

# show the current state of the players word
def show_player_word_letters(player_word_letters)
  puts "\n\nYour word => " + player_word_letters.map {|letter| letter + ' '}.join[0...-1]
end

# ask the player for a letter and show them what's left
def prompt_for_letter(name, alphabet)
  puts "\n\nOkay #{name}, pick a letter any, letter from the remaning letters.\n\n"
  puts alphabet.map {|letter| letter + '-'}.join[0...-1]
end   

# as long as one or more of the parts of the hangman needs to be placed, we'll allow the 
# player to continue guessing letters 
while hangman.count(hangman_placeholder) > 0
  
  # display the current state of the hangman
  show_hangman(hangman)

  # display the current state of the player's word
  show_player_word_letters(player_word_letters)

  # ask the player to pick a letter from the remaning letters, and show them the remaning letters
  prompt_for_letter(name, alphabet)

  letter = gets.chomp #get a letter from the player
  
  # if the letter they chose is not in the remaning letters ask the player to choose again
  # from the remaning letters
  until alphabet.include? letter
    puts "\n\nplease choose a letter from the remaning letters\n\n"
    letter = gets.chomp
  end


  if game_word_letters.include? letter # if the letter the player choose is in the game word
    # find the location(s) of the letter 
    letter_locations = game_word_letters.each_index.select { |lett| game_word_letters[lett] == letter }
    
    # replace the placeholder with the letter in the player's word
    letter_locations.each { |location| player_word_letters[location] = letter }
    
    # remove the letter from the alphabet so they can't pick it again
    alphabet.delete letter
    
    system "cls" #clear the screen

    # let the player know they choose a letter that's in the game word
    puts "Yay! The letter '#{letter}' is in the word! :)"
  else #if the letter they choose is not in the game word
    alphabet.delete letter # delete it from the alphabet
    hangman.shift # remove the first hangman part placeholder
    hangman << hangman_parts.shift # add the part to the end of the hangman
    system "cls" # clear the screen

    # let the player know the letter is not in the game word
    puts "Crap! The letter '#{letter}' is not in the word. :("
  end

  # if the player figures out the game word
  unless player_word_letters.include? player_word_letters_placeholder # check that the player word has no more underscores
    puts "\n\nCongratulations #{name}. You win!!!" # congratulate the player
    show_hangman(hangman) #show the hangman
    show_player_word_letters(player_word_letters) #show the word
    exit #exit the program
  end

  # if the player runs out of chances
  unless hangman.include? hangman_placeholder # check that there are no more placeholders left for the hangman
    puts "\n\nSorry #{name}. You lose, better luck next time." # let them know they lost
    show_hangman(hangman) #show the hangman
    show_player_word_letters(player_word_letters) #show the current player word 
    puts "\n\nThe word was " + game_word_letters.join #show the game word
    exit # exit the program
  end
end
