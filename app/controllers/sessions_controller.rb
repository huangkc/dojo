get '/sessions/new' do
  erb :'sessions/login'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  
  if @user && @user.password == params[:password]
    session[:id] = @user.id
    # redirect "/users/#{session[:id]}"
    redirect "/users/#{current_user.id}"

  else
    flash[:error] = "Username or password is incorrect!"
    redirect '/sessions/new'
  end
end

get '/logout' do
  session[:id] = nil
  redirect "/"
end
