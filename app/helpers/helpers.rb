class Helpers

    def self.current_user(session) #parameter name  mattered...but why?
        @user = User.find(session[:user_id])
    end

    def self.is_logged_in?(session)
        !!session[:user_id]
        #if the USER_ID inside the SESSION hash exists - return TRUE or FALSE
        #!I dont understand how this will automatically compare itself to @user.id
        #!REVIEW ----
    end

end