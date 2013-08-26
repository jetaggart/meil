module SecureMessage::Config
  SUPPORTED_TYPES = [:active_record]
  SecureMessageException              = Class.new StandardError
  MissingConfigException              = Class.new SecureMessageException
  UnsupportedPersistenceTypeException = Class.new SecureMessageException


  def persistence
    @@persistence || raise_config_error
  end

  def set_persistence type, force_reload=false
    unsupported_type(type) unless SUPPORTED_TYPES.include?(type)

    @@persistence = type 

    file = "secure_message/persistence_adapters/#{type}.rb"

    force_reload ? load(file) : require(file)
  end

  private

  def raise_config_error
    message = "Need to set a value for SecureMessage.persistence"
    message << "\nSupported types are: #{SUPPORTED_TYPES.join(' ')}"
    raise MissingConfigException.new(message)
  end

  def unsupported_type type
    message = "Unsupported persistence type: #{type}"
    raise UnsupportedPersistenceTypeException.new(message)
  end
end
