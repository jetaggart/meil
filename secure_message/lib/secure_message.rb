def secure_message_gem_path
  File.dirname __FILE__
end


$LOAD_PATH.unshift(secure_message_gem_path) unless $LOAD_PATH.include?(secure_message_gem_path)

require 'active_support/core_ext/module/delegation'
require "virtus"
require "mail"

require 'ruby-debug'

module SecureMessage
  files = Dir.glob(File.join secure_message_gem_path, "secure_message/**/*.rb")
  files.each{|f| require f }

  def self.deliver message, options={}
    options[:message] = message
    options[:transport] ||= SecureMessage::EmailTransport.new
    options[:dao]       ||= SecureMessage::ActiveRecord::Dao.new

    SecureMessage::Message.new(options).deliver
  end
end
