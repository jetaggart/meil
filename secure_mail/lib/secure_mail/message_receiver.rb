class SecureMail
  class MessageReceiver
    def initialize user_dao, email_address
      @user_dao, @email_address = user_dao, email_address
    end

    def encrypted_body body
      # Here we'd have some kind of case
      # statement dependent on how the message
      # should be encrypted based on settings
      # read from the persisted user
      encryption.encrypt body
    end

    private

    def encryption
      receiver.encryption
    end

    def receiver
      @receiver ||= User.new(persisted)
    end

    def persisted
      @persisted ||= @user_dao.user_for @email_address
    end
  end
end
