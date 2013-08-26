require 'spec_helper'

describe "Functional" do
  let(:message) do 
    double 'message',
      from: 'from',
      to: recipient_email,
      body: "Unencrypted message"
  end

  let(:recipient_email) { "mark@example.com" }
  let(:transport) { SecureMessage::EmailTransport.new }

  let(:encrypted_body) do 
    "===BEGIN ENCRYPTED MESSAGE===\nUnencrypted message\n===END ENCRYPTED MESSAGE===\n"
  end

  before :all do
    SecureMessage::ActiveRecord::UserPersistence.destroy_all
  end

  context "happy path" do
    before do
      SecureMessage::ActiveRecord::UserPersistence.
        create({email: recipient_email, pgp_public_key: "some key"})
    end

    specify do
      expected = {from: "from",
                  to: recipient_email,
                  body: encrypted_body}


      Mail::Message.any_instance.should_receive(:deliver!)
      SecureMessage.deliver message, transport: transport
    end
  end

  context "User not found" do
    let(:recipient_email) { "not-found@example.com" }

    specify do
      expect { SecureMessage.deliver message, transport: transport }.
        to raise_error SecureMessage::UserNotFound
    end
  end
end
