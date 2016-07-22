# index
# get '/users' do
  # @users = User.all
  # erb :'users/index'
# end

#new - create new user form
get '/users/new' do
	erb :'users/new'
end

#post - Create new user - submit form
post '/users' do
  if params[:password].length < 6
    flash[:error] = "Password must be at least 6 characters"
    redirect '/users/new'
  end
  @user = User.new(username: params[:username], password: params[:password])
                  
  if @user.save 
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else 
    flash[:error] = "Username and password are required."
    # @errors = ["Email and password are required"]
    # @errors = @user.errors.full_messages
    erb :'/users/new'
 end 
end

# USER PROFILE PAGE
get '/users/:id' do
  @user = User.find(params[:id])
  @posts = @user.posts.order(:title)
  @comments = @user.comments
  @all_posts = Post.all.order(:title)
 erb :'users/show'
end

# edit user info
# get '/users/:id/edit' do
#   @user = User.find(params[:id])
#   erb :'users/edit'
# end

# ###update user attributes
# put '/users/:id' do
#   @user = User.find(params[:id])
#   @user.update(params[:user])
#   redirect "/users/#{@user.id}"
# end




