# Homepage (Root path)
require 'pry'

helpers do
  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end
end


get '/' do
 redirect '/songs'
end


get '/songs' do
  if session.has_key?(:user_id)
    @songs = Song.all
    erb :'songs/index'
  else
    redirect '/login'
  end
end

get '/songs/new' do
  if session.has_key?(:user_id)
    @song = Song.new
    erb :'songs/new'
  else
    redirect '/login'
  end
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end


post '/login' do
  username = params[:username]
  password = params[:password]
  user = User.find_by(username: username, password: password)
  if user
    session[:user_id] = user.id
    redirect '/songs'
  else
    erb :login
  end
end

post '/signup' do
  email = params[:email]
  username = params[:username]
  password = params[:password]

  user = User.new(email: email, username: username, password: password)
  if user.save
    session[:user_id] = user.id
    redirect '/songs'
  else
    erb :signup
  end
end


post '/songs' do
  @song = Song.new(
    author: params[:author],
    title: params[:title],
    url: params[:url]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end