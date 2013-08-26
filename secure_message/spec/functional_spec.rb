require 'spec_helper'

describe "Functional" do
  let(:message) do 
    double 'message',
      from: 'from',
      to: recipient_email,
      body: "Unencrypted message",
      subject: "Subject line"
  end

  let(:recipient_email) { "mark@example.com" }
  let(:transport) { SecureMessage::EmailTransport.new }

  let(:encrypted_body) do 
    "===BEGIN ENCRYPTED MESSAGE===\nUnencrypted message\n===END ENCRYPTED MESSAGE===\n"
  end

  before :all do
    SecureMessage::ActiveRecord::UserPersistence.destroy_all
  end

  def set_smtp_settings
    config = YAML::load(File.open('spec/smtp_settings.yml'))

    config["authentication"] = config["authentication"].to_sym
    Mail.delivery_method.settings = config
  end

  context "happy path" do
    before do
      SecureMessage::ActiveRecord::UserPersistence.
        create({email: recipient_email, pgp_public_key: "some key"})

      if ENV["SEND_EMAIL"]
        set_smtp_settings
      else
        Mail::Message.any_instance.should_receive(:deliver!)
      end
    end

    specify do
      expected = {
        from:    "from",
        to:      recipient_email,
        body:    encrypted_body,
        subject: "Subject line"
      }

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
