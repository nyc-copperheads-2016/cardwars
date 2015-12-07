get '/decks/:id' do
  new_round = Round.create(user_id: session[:user_id])
  new_round.deck = Deck.find(params[:id])
  new_round.deck.cards.each do |card|
    card.update(incorrect_guesses: 0)
    card.update(correct: false)
  end
  new_card = new_round.deck.cards.shuffle.pop
  erb :'rounds/new', locals: { round: new_round, card: new_card }
end
