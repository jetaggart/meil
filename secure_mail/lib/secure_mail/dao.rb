class SecureMail::Dao
  def initialize persistence
    @persistence = persistence
  end

  def user_for email
    @persistence.find_user(email)
  end
end
