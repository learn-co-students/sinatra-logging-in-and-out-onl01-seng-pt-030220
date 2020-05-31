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

# If there is a match, set the session to the user's ID,
#redirect them to the /account route (using redirect to),
#and use ERB to display the user's data on the page.
# If there is no match, render the error page.

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/account'
    end
    erb :error
  end

  # @user = User.find_by(email: params[:email], password: params[:password])
  #   if @user
  #     session[:user_id] = @user.id
  #     redirect '/users/home'
  #   end
  #   redirect '/sessions/login'
  # end

 #  get '/sessions/login' do
 #
 #  # the line of code below render the view page in app/views/sessions/login.erb
 #  erb :'sessions/login'
 # end

 get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
end
