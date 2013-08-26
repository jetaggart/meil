module SecureMessage
  class Message
    include Virtus

    attribute :dao
    attribute :message
    attribute :transport

    def deliver
      params = {from: message.from, to:   message.to, body: encrypted}

      @transport.deliver params
    end

    private

    def encrypted
      recipient.encrypt(message.body)
    end

    def recipient
      @recipient ||= Receiver.new persisted_user: persisted_user
    end

    def persisted_user
      @persisted_user ||= dao.user_for(message.to)
    end
  end
end
