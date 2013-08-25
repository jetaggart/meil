require 'active_support/core_ext/module/delegation'
require 'active_record'

require "secure_mail/version"
require "secure_mail/message_receiver"
require "secure_mail/dao"
require "secure_mail/user_persistence"
require "secure_mail/user"

class SecureMail
  def self.deliver receiver, transport, message
    new(receiver, transport).deliver message
  end

  def initialize message_receiver, transport
    @message_receiver, @transport = message_receiver, transport
  end

  def deliver message
    encrypted = @message_receiver.encrypted_body(message.body)

    params = {from: message.from, to:   message.to, body: encrypted}

    @transport.deliver params
  end
end

