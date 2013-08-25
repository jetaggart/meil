module CLI
  class Client
    def initialize(mail_client)
      @mail_client = mail_client
    end

    def send_mail(*args)
      mail_client.send_mail(*args)
    end

    private

    attr_reader :mail_client
  end
end
