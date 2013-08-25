require 'spec_helper'

describe "Integration" do
  let(:dao) { SecureMail::Dao.new persistence }
  let(:persistence) { SecureMail::UserPersistence }
  let(:message_receiver) { SecureMail::MessageReceiver.new dao, "mark@example.com" }
  let(:transport) { double 'transport', deliver: true }

  let(:message) do 
    double 'message', from: 'from', to: 'to', body: "Unencrypted message"
  end


  before :all do
    load 'db/connection.rb'
  end

  before do
    SecureMail::UserPersistence.create(email: "mark@example.com")
  end

  it do
    SecureMail.deliver(message_receiver, transport, message)

    expected = {:from=>"from", :to=>"to",
                :body=>"===BEGIN ENCRYPTED MESSAGE===\nUnencrypted message\n===END ENCRYPTED MESSAGE===\n"}
    transport.should have_received(:deliver).with expected
  end
end
