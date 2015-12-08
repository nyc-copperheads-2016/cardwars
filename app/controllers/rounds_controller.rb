# Proper convention (REST) is:
#
# Given :id is a deck_id, a proper route might look like:
#
# GET '/decks/:id/rounds/new'
get '/rounds/new/:id' do
  erb :'rounds/new'
end

# put '/rounds/:id/answer'
put '/rounds/answer/:id' do
  # You really need the card id in order to get a card object here.  Given that,
  # optimally we would be able to say card.is_correct?(answer)
  card = Card.find_by(id: params[:card_id])

  correct_answer = params[:card]
  current_round = Round.find(params[:id])
  result = false

  # I'd love to have this be:
  # if card.is_correct?(answer)
  #   card.mark_correct!
  # else
  #   ...
  # end
  if params[:user_answer].downcase == correct_answer.downcase
    card.update(correct: true)
    result = true
  else
    # wow.  This is a super long method call.  Not sure where it ends...
    #
    # Really need to move this business logic into the models.  Controllers
    # should be pretty dumb.  models have the smarts.
    card.increment!(:incorrect_guesses)
  end
  current_round.update(num_guesses: (current_round[:num_guesses] + 1))
  erb :'/rounds/result', locals: { round: current_round, outcome: result, answer: correct_answer }
end

get '/rounds/:id' do
  current_round = Round.find(params[:id])
  leftovers = current_round.deck.cards.select { |card| card.correct == false }
  unless leftovers.length == 0
    new_card = leftovers.shuffle.pop
    erb :'rounds/new', locals: { round: current_round, card: new_card }
  else
    correct_first_try = current_round.deck.cards.select do |card|
      card.incorrect_guesses == 0
    end
    current_round.update(correct_first_guess: correct_first_try.length)
    erb :'/rounds/stats', locals: { round: current_round, correct: correct_first_try.length }
  end
end
