# path for create
get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params)
  if user.save
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  # @user = User.find_by(id: session[:user_id])
  current_user = User.find(params[:id])
  erb :'/users/show', locals: { user: current_user }
end


