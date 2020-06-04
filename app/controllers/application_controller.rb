require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @username = params["username"]
    @password = params[:password]
    if User.find_by_username(@username)
      session[:user_id] = User.find_by_username(@username).id
      redirect to "/account"
    else
      erb :error
    end
  end

  get '/account' do
    if session[:user_id]
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect to "/"
  end


end

