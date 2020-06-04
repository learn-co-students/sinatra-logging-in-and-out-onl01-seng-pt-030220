require_relative '../../config/environment'

class Helpers

    def self.current_user(session_hash)
    User.find(session_hash[:user_id])
    end

    def self.is_logged_in?(sh)
    if sh[:user_id] != nil 
        true 
        else
        false 
    end
    end
end