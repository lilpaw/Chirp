#user homepage, include login and sign up
get '/' do
  erb :"user/login"
end

post '/sessions' do
  @user = User.where(username: params[:username]).first

  if @user && (@user.password == params[:password])
    session[:user_id] = @user.id
    status 200
    redirect "/users/#{current_user.id}/profile"
  else
    status 400
    @login_failed = true
    erb :"user/login"
  end
end

delete '/sessions/:id' do
  session.delete(:user_id)
  redirect '/'
end

#user sign up
get '/users/new' do
  erb :"user/signup"
end

post '/users' do
  @user = User.new(params)
  if @user.save
    status 200
    redirect '/tweets'
  else
    status 400
    redirect '/users/new'
  end
end

# display current user tweets aka profile page
get '/users/:id/profile' do
  @user_tweets = Tweet.where(user_id: params[:id])
  erb :"user/profile"

end
