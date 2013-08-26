module SecureMessage
  class EmailTransport
    def deliver message
      mail = Mail.new do
        from    message.from
        to      message.to
        body    message.body
        #subject 'This is a test email'
      end

      mail.deliver!
    end
  end
end
