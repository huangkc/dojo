get '/posts' do
  @posts = Post.order(:title)
  erb :'posts/index'
end
get '/posts/new' do
  erb :'/posts/new'
end

post '/posts' do
  @post = Post.new(user_id: current_user.id, title: params[:title], content: params[:content])
  if @post.save
    redirect "/users/#{current_user.id}"
  else 
    flash[:error] = "Failed to add post."
    redirect '/posts/new'
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments
  @posts = Post.all
  erb :'/posts/show'
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :'/posts/edit'
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update(title: params[:title], content: params[:content])
  redirect "/users/#{current_user.id}"
end

delete '/posts/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect "/users/#{current_user.id}"
end