class SecureMessage::UserPersistence < ActiveRecord::Base
end

class SecureMessage::Dao
  def initialize persistence=nil
    @persistence = persistence || SecureMessage::UserPersistence
  end

  def user_for email
    @persistence.find_by_email(email)
  end
end
