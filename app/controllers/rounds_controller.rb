get '/rounds/new/:id' do
  erb :'rounds/new'
end

put '/rounds/answer/:id' do
  correct_answer = params[:card]
  current_round = Round.find(params[:id])
  result = false
  if params[:user_answer].downcase == params[:card].downcase
    current_round.update(correct_first_guess: (current_round[:correct_first_guess] + 1))
    current_round.decks.first.cards.find(params[:card_id]).update(is_answered_correct: true)
    result = true
  end
  current_round.update(num_guesses: (current_round[:num_guesses] + 1))
  erb :'/rounds/result', locals: { round: current_round, outcome: result, answer: correct_answer }
end

get '/rounds/:id' do
  current_round = Round.find(params[:id])
  leftovers = current_round.decks.last.cards.select { |card| card.is_answered_correct == false }
  unless leftovers.length == 0
    new_card = leftovers.shuffle.pop
    erb :'rounds/new', locals: { round: current_round, card: new_card }
  else
    erb :'/rounds/stats', locals: { round: current_round }
  end
end
