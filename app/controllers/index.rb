get '/' do
<<<<<<< HEAD
  decks = Deck.all
  erb :'index', locals: { available_decks: decks }
end
=======
  erb :'/index'
end
>>>>>>> Allows For User Sign In/Out; Layout For All Pages-Without Backround Images
