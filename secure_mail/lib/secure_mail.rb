require 'active_support/core_ext/module/delegation'
require 'active_record'
require "virtus"

require "secure_mail/version"
require "secure_mail/message_receiver"
require "secure_mail/dao"

class SecureMail
  include Virtus

  class EmailTransport
    def deliver params
    end
  end

  attribute :dao
  attribute :message
  attribute :transport


  def self.deliver message, dao_klass = nil, transport_klass = nil
    dao_klass       ||= SecureMail::Dao
    transport_klass ||= SecureMail::EmailTransport

    new(message, dao_klass, transport_klass).deliver
  end

  def initialize message, dao_klass, transport_klass
    super(
      dao: dao_klass.new,
      transport: transport_klass.new,
      message: message
    )
  end

  def deliver
    params = {from: message.from, to:   message.to, body: encrypted}

    @transport.deliver params
  end

  private

  def encrypted
    recipient.encrypt(message.body)
  end

  def recipient
    @recipient ||= MessageReceiver.new persisted_user: persisted_user
  end

  def persisted_user
    @persisted_user ||= dao.user_for(message.to)
  end
end

