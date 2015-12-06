get '/rounds/:id' do
  erb :'rounds/new'
end

put '/rounds/answer/:id' do
  current_round = Round.find(params[:id])
  #binding.pry
  if params[:user_answer].downcase == params[:card].downcase
    current_round[:num_guesses] += 1
    current_round[:correct_first_guess] += 1
    current_round.decks.first.cards.find(params[:card_id]).update(is_answered_correct: true)
    redirect '/rounds/#{current_round.id}'
  else
    current_round[:num_guesses] += 1
    redirect '/rounds/incorrect_answer/#{current_round.id}'
  end
end

get '/rounds/:id/' do
  current_round = Round.find(params[:id])
  card_answer = current_round.decks.first.cards.find(params[:card_id]).answer
  erb :'rounds/correct_answer', locals: { round: current_round, answer: card_answer }
end

get '/rounds/:id/incorrect_answer/:card_id' do
  erb :'rounds/incorrect_answer'
end
