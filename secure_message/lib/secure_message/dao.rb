class SecureMessage::UserPersistence < ActiveRecord::Base
end

class SecureMessage::Dao
  def initialize persistence_klass=nil
    @persistence_klass = persistence_klass || SecureMessage::UserPersistence
  end

  def user_for email
    @persistence_klass.find_by_email(email)
  end
end
