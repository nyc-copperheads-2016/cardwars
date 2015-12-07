get '/' do
  decks = Deck.all
  erb :'index', locals: { available_decks: decks }
end
## I don't think the logic on lines 6-8 belongs in this route in particular.  I adjusted.
  #redirect "/index"
#end

 
#end



  
