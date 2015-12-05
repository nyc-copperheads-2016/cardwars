class Deck < ActiveRecord::Base
  has_many :cards
  belongs_to :round

  def load_cards
    #takes in all the cards with the id of the current deck
    #returns an array
    self.cards.to_a
  end
  def next_card
    #returns a random card in the deck
    self.cards.find_by(:id = rand(self.cards.size + 1))
  end
end
