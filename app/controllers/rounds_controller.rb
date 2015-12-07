get '/rounds/new/:id' do
  erb :'rounds/new'
end

put '/rounds/answer/:id' do
  correct_answer = params[:card]
  current_round = Round.find(params[:id])
  result = false
  if params[:user_answer].downcase == correct_answer.downcase
    current_round.decks.first.cards.find(params[:card_id]).update(correct: true)
    result = true
  else
    #binding.pry
    current_round.decks.first.cards.find(params[:card_id]).update(incorrect_guesses: ( current_round.decks.first.cards.find(params[:card_id]).incorrect_guesses + 1))
  end
  current_round.update(num_guesses: (current_round[:num_guesses] + 1))
  erb :'/rounds/result', locals: { round: current_round, outcome: result, answer: correct_answer }
end

get '/rounds/:id' do
  current_round = Round.find(params[:id])
  leftovers = current_round.decks.last.cards.select { |card| card.correct == false }
  unless leftovers.length == 0
    new_card = leftovers.shuffle.pop
    erb :'rounds/new', locals: { round: current_round, card: new_card }
  else
    correct_first_try = current_round.decks.first.cards.select do |card|
      card.incorrect_guesses == 0
    end
    current_round.update(correct_first_guess: correct_first_try.length)
    erb :'/rounds/stats', locals: { round: current_round, correct: correct_first_try.length }
  end
end
