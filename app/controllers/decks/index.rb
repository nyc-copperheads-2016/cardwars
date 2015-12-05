get '/decks/:id' do
  current_deck = Deck.find(params[:id])
  erb :'decks/index', locals: { deck: current_deck }
end
