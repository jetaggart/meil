require 'active_support/core_ext/module/delegation'
require 'active_record'
require "virtus"
require "mail"

require "secure_message/version"
require "secure_message/receiver"
require "secure_message/message"
require "secure_message/dao"
require "secure_message/email_transport"

def SecureMessage.deliver params
  params.fetch :message #ensure we have a message

  params[:transport] ||= SecureMessage::EmailTransport.new
  params[:dao]       ||= SecureMessage::Dao.new

  SecureMessage::Message.new(params).deliver
end
