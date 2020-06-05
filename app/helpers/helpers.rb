class Helpers

  def self.current_user(session)
    @user = User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
    # @logged_in = User.find(session[:user_id])
    # if !@logged_in
    #   false
    # else
    #   true
    # end
  end

end