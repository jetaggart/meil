class SecureMail::User
  def initialize persisted
    @persisted = persisted
  end

  def encryption
    @encryption ||= Encryption.new persisted.pgp_public_key
  end

  private

  attr_reader :persisted

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
