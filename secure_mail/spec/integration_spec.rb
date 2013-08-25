require 'spec_helper'

describe "Integration" do
  let(:message) do 
    double 'message',
      from: 'from',
      to: recipient_email,
      body: "Unencrypted message"
  end

  let(:recipient_email) { "mark@example.com" }
  let(:transport) { SecureMail::EmailTransport }
  let(:encrypted_body) do 
    "===BEGIN ENCRYPTED MESSAGE===\nUnencrypted message\n===END ENCRYPTED MESSAGE===\n"
  end


  before :all do
    load 'db/connection.rb'

    SecureMail::UserPersistence.destroy_all
  end

  before do
    SecureMail::EmailTransport.any_instance.stub(:deliver)
    SecureMail::UserPersistence.create(email: recipient_email,
                                       pgp_public_key: "some key")
  end

  it do
    expected = {from: "from",
                to: recipient_email,
                body: encrypted_body}


    transport.any_instance.should_receive(:deliver).with expected
    SecureMail.deliver message
  end
end
