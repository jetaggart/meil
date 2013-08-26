def secure_message_gem_path
  File.dirname __FILE__
end


$LOAD_PATH.unshift(secure_message_gem_path) unless $LOAD_PATH.include?(secure_message_gem_path)

require 'active_support/core_ext/module/delegation'
require "virtus"
require "mail"

require 'ruby-debug'

module SecureMessage
  files = Dir.glob(File.join secure_message_gem_path, "secure_message/*.rb")
  files.each{|f| require f }

  extend SecureMessage::Config

  def self.deliver params
    check_config!

    params.fetch :message #ensure we have a message

    params[:transport] ||= SecureMessage::EmailTransport.new
    params[:dao]       ||= SecureMessage::Dao.new

    SecureMessage::Message.new(params).deliver
  end
end
