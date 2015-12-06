get '/decks/:id' do
  current_deck = Deck.find(params[:id])
  new_round = Round.create(deck_id: params[:id], user_id: session[:user_id])
  erb :'rounds/new', locals: { deck: current_deck, round: new_round }
end
