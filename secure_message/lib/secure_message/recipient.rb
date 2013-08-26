module SecureMessage
  class Recipient
    include Virtus
    attribute :persisted_user

    delegate :encrypt, to: :encryption

    private

    def encryption
      @encryption ||= Encryption.new persisted_user.pgp_public_key
    end
  end
end
