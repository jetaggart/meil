require 'active_support/core_ext/module/delegation'
require 'active_record'
require "virtus"
require "mail"

require "secure_message/version"
require "secure_message/receiver"
require "secure_message/dao"
require "secure_message/email_transport"

module SecureMessage
  def self.deliver params
    params.fetch :message #ensure we have a message

    params[:transport] ||= SecureMessage::EmailTransport.new
    params[:dao]       ||= SecureMessage::Dao.new

    Message.new(params).deliver
  end

  class Message
    include Virtus

    attribute :dao
    attribute :message
    attribute :transport

    def deliver
      params = {from: message.from, to:   message.to, body: encrypted}

      @transport.deliver params
    end

    private

    def encrypted
      recipient.encrypt(message.body)
    end

    def recipient
      @recipient ||= Receiver.new persisted_user: persisted_user
    end

    def persisted_user
      @persisted_user ||= dao.user_for(message.to)
    end
  end
end

