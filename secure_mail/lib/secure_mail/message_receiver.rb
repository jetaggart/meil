class SecureMail
  class MessageReceiver
    def initialize user_dao, email_address
      @user_dao, @email_address = user_dao, email_address
    end

    def encrypted_body body
      encryption.encrypt body
    end

    private

    def encryption
      @encryption ||= Encryption.new persisted_user.pgp_public_key
    end

    def persisted_user
      @persisted_user ||= @user_dao.user_for @email_address
    end

    class Encryption
      def initialize key
        @key = key
      end

      #nonsense encryption to prove concept
      def encrypt body
        <<-MESSAGE.gsub(/^\s*/, '')
      ===BEGIN ENCRYPTED MESSAGE===
        #{body}
      ===END ENCRYPTED MESSAGE===
        MESSAGE
      end
    end

  end
end
