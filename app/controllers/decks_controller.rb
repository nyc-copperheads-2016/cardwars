get '/decks/:id' do
  new_round = Round.create(user_id: session[:user_id])
  new_round.decks << Deck.find(params[:id])
  new_round.decks.first.cards.each do |card|
    card.update(incorrect_guesses: 0)
  end
  new_card = new_round.decks.last.cards.shuffle.pop
  erb :'rounds/new', locals: { round: new_round, card: new_card }
end
