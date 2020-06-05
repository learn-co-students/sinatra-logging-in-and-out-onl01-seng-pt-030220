class Helpers

    def self.current_user(session)
        @user = User.find(session[:user_id])
    end

    def self.is_logged_in?(session)
        # could have just used this code:
        #  !!session[:user_id] 
        @user = User.find(session[:user_id])
        if @user.id == session[:user_id]
            true 
        else
            false
        end
    end

end