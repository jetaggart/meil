require 'active_support/core_ext/module/delegation'
require "virtus"
require "mail"
require 'ruby-debug' if ENV["MRI_RSPEC_SUITE"]

files = Dir.glob("lib/secure_message/**/*.rb")
files.each{|f| require File.expand_path(f) }


def SecureMessage.deliver message, options={}
  SecureMessage::MessageSender.new(message, options).deliver
end
