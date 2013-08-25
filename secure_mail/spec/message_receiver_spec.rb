require 'spec_helper'

describe SecureMail::MessageReceiver do
  let(:user_dao) { double 'user dao', user_for: user }
  let(:user) { double 'user', pgp_public_key: "SOME KEY" }

  specify do
    message_receiver = SecureMail::MessageReceiver.new user_dao, "email address"

    body = message_receiver.encrypted_body("unencrypted")

    body.should =~ /===BEGIN ENCRYPTED MESSAGE===/
    body.should =~ /unencrypted/
    body.should =~ /===END ENCRYPTED MESSAGE===/
  end
end
