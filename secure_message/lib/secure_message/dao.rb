class SecureMessage::Dao
  def initialize persistence_klass=nil
    @persistence_klass = persistence_klass || self.class.default_klass
  end

  def user_for email
    @persistence_klass.find_by_email(email)
  end

  def self.default_klass
    @@default_klass ||= SecureMessage::UserPersistence
  end
end
