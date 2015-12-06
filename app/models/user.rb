require 'bcrypt'

class User < ActiveRecord::Base
    include BCrypt
 
  has_many :rounds
  
  validates :username, presence: true
  validates :password, presence: true, length:{minimum: 10}
  #validates_presence_of :username, :message => "Sorry, That Username Is Taken.  Please Try Again"
  
  ## Lines 10, 12 and 13 are what I (Courtney) had at first.
  #validates :username_confirmation, {uniqueness: true}, {minimum: 10}
  #validates_confirmation_of :username, :message => "Sorry, That Username Is Taken.  Please Try Again"
   
  #def username_confirmation_is_valid?
    #unless username_confirmation == self.username
     # errors.add(:username_confirmation => :message)
    #end
  #end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end


    # Name of the deck played.
    # The number of cards answered correctly on the first guess compared to the number of cards in the deck.
    # Total number of guesses made.

    # Statistics for all rounds played should be available.
    # Statistics should be organized by deck and displayed in chronological order.
    # For each round, required details are the date the round was played, the number of cards in the deck, the number of cards answered correctly on the first guess, and the total number of guesses needed to complete the round.
