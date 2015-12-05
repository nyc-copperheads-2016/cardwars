class Card < ActiveRecord::Base
  belongs_to :deck
  def is_correct?(guess)
    guess.downcase==answer.downcase
  end
end
