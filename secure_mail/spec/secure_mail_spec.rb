require 'spec_helper'

describe SecureMail do
  let(:message_receiver) { double 'message receiver', encrypted_body: "Encrypted message" }
  let(:transport) { double 'transport', deliver: true }
  let(:message) { double 'message', from: 'from', to: 'to', body: "Unencrypted message"}

  it do
    SecureMail.deliver(message_receiver, transport, message)

    transport.should have_received(:deliver)
  end
end
