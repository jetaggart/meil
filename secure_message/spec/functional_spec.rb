require 'spec_helper'

describe "Functional" do
  let(:message) do 
    double 'message',
      from: 'from',
      to: recipient_email,
      body: "Unencrypted message"
  end

  let(:recipient_email) { "mark@example.com" }
  let(:transport) { double 'transport', deliver: true }

  let(:encrypted_body) do 
    "===BEGIN ENCRYPTED MESSAGE===\nUnencrypted message\n===END ENCRYPTED MESSAGE===\n"
  end


  before :all do
    SecureMessage.set_persistence(:active_record, true)
    SecureMessage::Dao.default_klass.destroy_all
  end

  before do
    SecureMessage::UserPersistence.
      create({email: recipient_email, pgp_public_key: "some key"})
  end

  it do
    expected = {from: "from",
                to: recipient_email,
                body: encrypted_body}


    transport.should_receive(:deliver).with expected
    SecureMessage.deliver message: message, transport: transport
  end
end
