module SecureMessage
  class MessageSender
    def initialize message, options
      @dao        = options[:dao]       || SecureMessage::ActiveRecord::Dao.new
      @transport  = options[:transport] || SecureMessage::EmailTransport.new

      encryptor  =recipient(message.to)

      @message = SecureMessage::Message.new(message, encryptor)
    end

    def deliver
      @transport.deliver @message
    end

    private

    def recipient(email)
      Recipient.new persisted_user: persisted_user(email)
    end

    def persisted_user(email)
      @persisted_user = @dao.user_for(email) || raise_not_found(email)
    end

    def raise_not_found(email)
      raise SecureMessage::UserNotFound.new("User for recipient #{email} not found")
    end
  end
end
