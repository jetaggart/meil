module SecureMessage
  class Receiver
    include Virtus
    attribute :persisted_user

    delegate :encrypt, to: :encryption

    private

    def encryption
      @encryption ||= Encryption.new persisted_user.pgp_public_key
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
