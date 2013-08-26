require 'active_support/core_ext/module/delegation'
require "virtus"
require "mail"

require "secure_message/version"
require "secure_message/config"
require "secure_message/dao"
require "secure_message/encryption"
require "secure_message/message"
require "secure_message/recipient"
require "secure_message/email_transport"

module SecureMessage
  extend SecureMessage::Config

  def self.deliver params
    params.fetch :message #ensure we have a message

    params[:transport] ||= SecureMessage::EmailTransport.new
    params[:dao]       ||= SecureMessage::Dao.new

    SecureMessage::Message.new(params).deliver
  end
end
