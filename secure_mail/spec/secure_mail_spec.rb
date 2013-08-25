require 'spec_helper'

describe SecureMail do
  let(:message_receiver) { double 'message receiver', encrypted_body: "Encrypted message" }
  let(:transport) { double 'transport', send: true }
  let(:message) { double }

  it do
    SecureMail.deliver(message_receiver, transport, message)

    transport.should have_received(:send).with "Encrypted message"
  end
end
