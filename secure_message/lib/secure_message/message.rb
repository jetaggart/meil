module SecureMessage
  class Message
    include Virtus

    attribute :dao
    attribute :message
    attribute :transport

    def initialize attributes
      validate_message attributes.fetch(:message)

      super
    end

    def deliver
      params = {to:   message.to, 
                from: message.from, 
                body: encrypted}

      @transport.deliver params
    end

    private

    def validate_message message
      unless [:from, :to, :body].all? { |f| message.respond_to?(f)}
        raise ArgumentError.new("Invalid Message: #{message}.\nbody, from, and to required")
      end
    end

    def encrypted
      recipient.encrypt(message.body)
    end

    def recipient
      @recipient ||= Recipient.new persisted_user: persisted_user
    end

    def persisted_user
      @persisted_user = dao.user_for(message.to) || raise_not_found
    end

    private

    def raise_not_found
      raise SecureMessage::UserNotFound.new("User for recipient #{message.to} not found")
    end
  end
end
