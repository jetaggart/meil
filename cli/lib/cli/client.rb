module CLI
  class Client
    def initialize(message_sender)
      @mail_client = message_sender
    end

    def send_mail(*args)
      message_sender.send_message(*args)
    end

    private

    attr_reader :mail_client
  end
end
