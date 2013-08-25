require 'thor'

module CLI
  class ThorClient < Thor

    desc "send_mail", "this command sends mail"
    def send_mail(from, to, body)
      Client.new(FakeMailClient.new).send_mail(from: from, to: to, body: body)
    end


    class FakeMailClient
      def send_mail(*args)
        puts "sending mail: #{args}"
      end
    end
  end
end
