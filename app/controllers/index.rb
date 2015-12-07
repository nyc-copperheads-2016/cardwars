get '/' do
  redirect "/index"
end

## I don't think the logic on lines 6-8 belongs in this route in particular.  I adjusted.
  #decks = Deck.all
  #erb :'index', locals: { available_decks: decks }
#end

  #erb :'/index'
#end

