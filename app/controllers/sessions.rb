get '/sessions/new' do
  erb :"user/login"
end

post '/sessions' do
  @user = User.where(username: params[:username]).first

  if @user && (@user.password == params[:password])
    session[:user_id] = @user.id
    status 200
    redirect '/'
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

