require 'active_support/core_ext/module/delegation'
require "virtus"
require "mail"

module SecureMessage
  Dir.glob("./lib/secure_message/*.rb").each{|f| require f }
  extend SecureMessage::Config

  def self.deliver params
    check_config!

    params.fetch :message #ensure we have a message

    params[:transport] ||= SecureMessage::EmailTransport.new
    params[:dao]       ||= SecureMessage::Dao.new

    SecureMessage::Message.new(params).deliver
  end
end
