class SecureMail::UserPersistence < ActiveRecord::Base
end

class SecureMail::Dao
  def initialize persistence=nil
    @persistence = persistence || SecureMail::UserPersistence
  end

  def user_for email
    @persistence.find_by_email(email)
  end
end
