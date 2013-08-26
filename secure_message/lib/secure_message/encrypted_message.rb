module SecureMessage
  class EncryptedMessage
    def initialize message, encryptor
      @message, @encryptor = message, encryptor
      validate_message
    end

    def body
      @encryptor.encrypt(message.body)
    end

    private

    attr_reader :message
    MESSAGE_FIELDS = [:subject, :from, :to, :body]
    (MESSAGE_FIELDS - [:body]).each {|f| delegate f, to: :message }

    def validate_message
      unless MESSAGE_FIELDS.all? { |f| message.respond_to?(f)}
        error_message = "Invalid Message: #{message}.\n#{MESSAGE_FIELDS} required"

        raise ArgumentError.new(error_message)
      end
    end
  end
end
