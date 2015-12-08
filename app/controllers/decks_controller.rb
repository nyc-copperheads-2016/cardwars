# GET requests - DO NOT UPDATE THE DATABASE.  The first line creates a Round object.
#
# Given that this method creates a round, I'd like it to be on the rounds controller
# OR
# It can be a nested route under decks, but with round as the primary object.
#
# post '/decks/:deck_id/rounds'
get '/decks/:id' do
  # Try to build off of your existing objects and their associations:

  # round = current_user.rounds.create()
  # round.deck = Deck.find(params[:id])

  new_round = Round.create(user_id: session[:user_id])
  new_round.deck = Deck.find(params[:id])
  new_round.deck.cards.each do |card|
    # The fact that you have to do this should point you to a code smell that
    # can be cleaned up.  In this case, you need to update a static asset each
    # time you start a game.  Better would be to store that info in some type
    # of throw-away asset (Guess object?)
    card.update(incorrect_guesses: 0)
    card.update(correct: false)
  end


  # this line is doing too much work in the controller.  I think this a good place
  # to introduce a method on your Round object... next_card!
  #
  # new_card = new_round.next_card!
  new_card = new_round.deck.cards.shuffle.pop
  erb :'rounds/new', locals: { round: new_round, card: new_card }
end
