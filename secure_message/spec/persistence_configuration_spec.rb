require 'spec_helper'

describe "Persistence Configuration" do
  before do
    hide_const "SecureMessage::UserPersistence"
  end

  specify "selecting active_record" do
    expect{SecureMessage::UserPersistence.all}.to raise_error NameError

    SecureMessage.set_persistence :active_record, true

    expect{SecureMessage::UserPersistence.all}.to_not raise_error
  end
end
