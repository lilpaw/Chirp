#user homepage, include login and sign up
get '/' do
  erb :index
end

#user sign up
get '/users/new' do
  erb :signup
end

post '/users' do
  @user = User.new(params)
  if @user.save
    status 200
    redirect '/'
  else
    status 400
    redirect '/users/new'
  end
end
