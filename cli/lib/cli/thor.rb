require 'thor'

module CLI
  class ThorClient < Thor

    desc "send_mail", "this command sends mail"
    def send_mail(from, to, body)
      SecureMessage::Client.new.send_mail(from: from, to: to, body: body)
    end

  end
end
