lib = File.dirname(__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


require 'thor'
require 'secure_message'

require "cli/version"
require 'cli/client'
require 'cli/thor_client'

