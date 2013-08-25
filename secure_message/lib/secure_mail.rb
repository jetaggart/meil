require 'active_support/core_ext/module/delegation'
require 'active_record'
require "virtus"

require "secure_mail/version"
require "secure_mail/message_receiver"
require "secure_mail/dao"

class SecureMessage
  include Virtus

  class EmailTransport
    def deliver params
    end
  end

  attribute :dao
  attribute :message
  attribute :transport

  def self.deliver params
    params.fetch :message #ensure we have a message

    params[:transport] ||= SecureMessage::EmailTransport.new
    params[:dao]       ||= SecureMessage::Dao.new

    new(params).deliver
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
    debugger
    @persisted_user ||= dao.user_for(message.to)
  end
end

