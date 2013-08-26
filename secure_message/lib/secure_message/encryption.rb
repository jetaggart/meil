module SecureMessage
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
