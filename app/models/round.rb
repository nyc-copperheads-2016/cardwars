class Round < ActiveRecord::Base
  has_many :decks
  belongs_to :user
end
