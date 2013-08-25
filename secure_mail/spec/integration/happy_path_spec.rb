require 'spec_helper'

describe "Integration" do
  let(:dao) { SecureMail::Dao.new persistence }
  let(:persistence) { SecureMail::UserPersistence }
  let(:message_receiver) { SecureMail::MessageReceiver.new dao, "mark@example.com" }
  let(:transport) { double 'transport' }

  before :all do
    load 'db/connection.rb'
  end

  before do
    SecureMail::UserPersistence.create(email: "mark@example.com")
  end

  it do
    SecureMail.deliver(message_receiver, transport)

    transport.should have_received(:send).with "Encrypted message"
  end
end
