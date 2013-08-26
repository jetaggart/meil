module SecureMessage
  class EncryptedMessage
    FIELDS = [:subject, :to, :from, :body]
    delegate :subject, :to, :from , to: :unencrypted

    def initialize unencrypted, encryptor
      @unencrypted, @encryptor = unencrypted, encryptor
      validate
    end

    def body
      @encryptor.encrypt(unencrypted.body)
    end

    private

    attr_reader :unencrypted

    def validate
      raise_error unless FIELDS.all? { |f| unencrypted.respond_to?(f)}
    end

    def raise_error
      raise ArgumentError.new <<-ERROR.gsub(/^\s*/, "")
        Invalid Message: #{unencrypted}
        #{FIELDS} required"
        ERROR
    end

  end
end
