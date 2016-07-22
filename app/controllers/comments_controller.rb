get '/comments' do
  @comments = Comment.all
  erb :'comments/index'
end

# get '/comments/new' do
#   erb :'/comments/new'
# end

post '/comments' do
  @comment = Comment.new(user_id: current_user.id, text: params[:text])
  if @comment.save
    redirect "/users/#{current_user.id}"
  else 
    flash[:error] = "Failed to add comment."
    redirect '/comments/new'
  end
end

get '/comments/:id' do
  @comment = Comment.find(params[:id])
  erb :'/comments/show'
end

get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])
  erb :'/comments/edit'
end

put '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.update(user_id: current_user.id, text: params[:text])
  redirect "/users/#{current_user.id}"
end

delete '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect "/users/#{current_user.id}"
end