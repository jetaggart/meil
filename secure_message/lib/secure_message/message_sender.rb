module SecureMessage
  class MessageSender
    def initialize message, options
      @dao        = options[:dao]       || ActiveRecord::Dao.new
      @transport  = options[:transport] || EmailTransport.new

      @to_email = message.to
      @message = EncryptedMessage.new(message, encryptor)
    end

    def deliver
      @transport.deliver @message
    end

    private

    attr_reader :to_email

    def encryptor
      recipient
    end

    def recipient
      Recipient.new persisted_user: persisted_user
    end

    def persisted_user
      @persisted_user = @dao.user_for(to_email) || raise_not_found
    end

    def raise_not_found
      raise SecureMessage::UserNotFound.new("User for recipient #{to_email} not found")
    end
  end
end
