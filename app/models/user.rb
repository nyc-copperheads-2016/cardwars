class User < ActiveRecord::Base
  has_many :rounds
end



    # Name of the deck played.
    # The number of cards answered correctly on the first guess compared to the number of cards in the deck.
    # Total number of guesses made.

    # Statistics for all rounds played should be available.
    # Statistics should be organized by deck and displayed in chronological order.
    # For each round, required details are the date the round was played, the number of cards in the deck, the number of cards answered correctly on the first guess, and the total number of guesses needed to complete the round.
