get '/' do
  decks = Deck.all
  erb :'index', locals: { available_decks: decks }
end

#we might want to rethink this- should redirect to the index.erb instead of putting deck logic here. Just a thought -Court
