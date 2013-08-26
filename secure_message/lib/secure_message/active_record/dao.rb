module SecureMessage 
  module ActiveRecord
    class Dao
      def user_for email
        UserPersistence.find_by_email(email)
      end
    end
  end
end
