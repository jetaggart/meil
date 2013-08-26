module SecureMessage 
  class Dao
    def user_for email
      #Hard code AR dependency
      SecureMessage::UserPersistence.find_by_email(email)
    end
  end
end
