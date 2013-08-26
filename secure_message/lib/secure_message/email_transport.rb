module SecureMessage
  class EmailTransport
    def deliver params
      mail = Mail.new do
        from    params[:from]
        to      params[:to]
        #subject 'This is a test email'
        body    params[:body]
      end

      mail.deliver!
    end
  end
end
