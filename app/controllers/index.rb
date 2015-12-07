get '/' do
  decks = Deck.all
  erb :'index', locals: { available_decks: decks }
end
