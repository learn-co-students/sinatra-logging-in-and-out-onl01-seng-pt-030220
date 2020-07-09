#* HANDLES HTTP REQUESTS
#* CONNECT TO MODELS

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
    #use FIND_BY because NO MATCH returns NIL
    @user = User.find_by(username: params[:username])

    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to "/account"
    end

    erb :error
  end

  get '/account' do
    if @user = User.find_by(id: session[:user_id])
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

