get '/tweets' do
  @tweets = Tweet.all

  erb :"tweets/index"
end

get '/tweets/new' do
  ensure_logged_in!

  erb :"tweets/new"
end

post '/tweets' do
  ensure_logged_in!

  @new_tweet = Tweet.new(
    body: params[:tweet],
    user_id: current_user.id,
  )

  if @new_tweet.save
    status 200
    redirect "/users/#{current_user.id}/profile"
  else
    status 400
    'tweet failed to save'
  end

end

#delete tweet
delete '/tweets/:id' do
  tweet = Tweet.where(id: params[:id]).first
  if tweet.destroy
    status 200
    redirect '/users/#{current_user.id}/profile'
  else
    status 400
    'tweet failed to delete'
  end
end

#update tweet
get '/tweets/:id/edit' do
  @tweet = Tweet.where(id: params[:id]).first
  erb :"tweets/edit"
end

put '/tweets/:id' do
  @tweet = Tweet.where(id: params[:id]).first
  @tweet.update(body: params[:body])
  redirect '/users/#{current_user.id}/profile'
end
