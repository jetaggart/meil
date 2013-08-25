require 'spec_helper'

module CLI
  describe Client do
    let(:mail_client) { mock.as_null_object }

    it "takes the arguments and sends a message" do
      cli = Client.new(mail_client)
      cli.send_mail(from: "jeff@jetaggart.com",
                    to: "john@smith.com",
                    body: "This is a mail message")

      expect(mail_client).to have_received(:send_mail).with(from: "jeff@jetaggart.com",
                                                            to: "john@smith.com",
                                                            body: "This is a mail message")
    end
  end
end
