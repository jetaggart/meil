require 'active_support/core_ext/module/delegation'
require "virtus"
require "mail"
require 'ruby-debug'

lib = File.dirname __FILE__
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
files = Dir.glob(File.join lib, "secure_message/**/*.rb")
files.each{|f| require f }


module SecureMessage
  def self.deliver message, options={}
    SecureMessage::MessageSender.new(message, options).deliver
  end
end
