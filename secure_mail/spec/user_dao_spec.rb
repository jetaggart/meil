require 'spec_helper'

describe SecureMail::Dao do
  let(:dummy_persistence) { double 'dummy lookup' }
  let(:user) { double 'user' }

  it do
    dao = SecureMail::Dao.new dummy_persistence

    dummy_persistence.should_receive(:find_user).
      with("some email").
      and_return(user)

    result = dao.user_for("some email")

    result.should == user
  end
end
