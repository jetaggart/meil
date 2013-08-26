module SecureMessage::Config
  SUPPORTED_TYPES = [:active_record]
  SecureMessageException              = Class.new StandardError
  MissingConfigException              = Class.new SecureMessageException
  UnsupportedPersistenceTypeException = Class.new SecureMessageException

  @@persistence = nil

  def persistence
    @@persistence || missing_config!
  end

  def set_persistence type, force_reload=false
    @@persistence = type 
    check_config!

    file = "secure_message/adapters/#{type}.rb"

    force_reload ? load(file) : require(file)
  end

  def check_config!
    if persistence
      unsupported_type!(@@persistence) unless supported?
    end
  end

  private

  def supported?
    SUPPORTED_TYPES.include?(@@persistence)
  end

  def missing_config!
    raise MissingConfigException.new <<-MESSAGE.gsub(/^\s*/,"")
      Need to set a value for SecureMessage.persistence
      Supported types are: #{SUPPORTED_TYPES.join}
    MESSAGE
  end

  def unsupported_type! type
    message = "Unsupported persistence type: #{type}"
    raise UnsupportedPersistenceTypeException.new(message)
  end
end
