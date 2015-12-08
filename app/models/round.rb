# coding: utf-8
class Round < ActiveRecord::Base
  has_one :deck
  belongs_to :user

  def next_card!
    deck.cards.find_by(id: rand(self.cards.size + 1))
  end
end

    # The user plays every card in the deck.
    # The cards are played in a random order.
    # For each card, the user is shown a prompt and responds by submitting a guess.
    # After submitting a guess, the user is informed whether or not the guess was correct and shown the correct answer.
    # The round continues until each card is answered correctly—after going through each card, cards answered incorrectly will be displayed again.
