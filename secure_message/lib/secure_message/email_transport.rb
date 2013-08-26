module SecureMessage
  class EmailTransport
    def deliver message
      mail = Mail.new do
        from    message.from
        to      message.to
        body    message.body
        subject message.subject
      end

      mail.deliver!
    end
  end
end
