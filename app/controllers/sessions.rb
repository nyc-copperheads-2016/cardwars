get '/sessions/new' do
  erb :'/sessions/new'
end

#post '/sessions' do
#  user = User.find_by(username: params[:username])
#  if user && user.password == params[:password_hash]
#    session[:username] = user.username
#    redirect '/index'
#  else
#    redirect '/sessions/error'
#  end
#end


post '/sessions' do
  user = User.find_by(username: params[:username])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect '/index'
  else
    redirect '/sessions/new'
  end
end


delete '/sessions' do
  session.clear
  redirect '/index'
end

