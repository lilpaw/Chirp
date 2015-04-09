get '/tweets' do
  @tweets = Tweet.all
  erb :"tweets/index"
end

get '/tweets/new' do
  erb :"tweets/new"
end

post '/tweets' do
  new_tweet = Tweet.new(body: params[:tweet])
  if new_tweet.save
    status 200
    redirect '/tweets'
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
    redirect '/tweets'
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
  redirect '/tweets'
end
