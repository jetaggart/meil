require 'spec_helper'

describe SecureMail::MessageReceiver do
  let(:user_dao) { double 'user dao', user_for: receiver }
  let(:receiver) { double 'receiver', encrypt: "encrypted" }

  specify do
    message_receiver = SecureMail::MessageReceiver.new user_dao, "email address"

    message_receiver.encrypted_body("unencrypted").should == "encrypted"
  end
end
