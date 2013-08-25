class SecureMail::UserPersistence < ActiveRecord::Base
  def self.find_user email
    find_by_email email
  end
end
