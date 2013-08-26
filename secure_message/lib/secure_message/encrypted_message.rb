module SecureMessage
  class EncryptedMessage
    def initialize message, encryptor
      @message, @encryptor = message, encryptor
      validate_message
    end

    def body
      @encryptor.encrypt(@message.body)
    end

    private

    attr_reader :message
    delegate :to, :from, to: :message

    def validate_message
      unless [:from, :to, :body].all? { |f| @message.respond_to?(f)}
        raise ArgumentError.new("Invalid Message: #{@message}.\nbody, from, and to required")
      end
    end
  end
end
