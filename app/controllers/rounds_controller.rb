get '/rounds/:id' do
  erb :'rounds/new'
end


put '/rounds/answer/:id' do
  current_round = Round.find(params[:id])
  #binding.pry
  if params[:user_answer].downcase == current_round.decks.first.cards.find(params[:card]).answer

    current_round[:num_guesses] += 1
    current_round[:correct_first_guess] += 1
    current_round.decks.first.cards.find(params[:card]).is_answered_correct = true
    binding.pry
  else
    current_round[:num_guesses] += 1
  end
  #binding.pry
end
