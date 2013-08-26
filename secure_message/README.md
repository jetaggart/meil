SecureMessage
=============


Enable sending of encrypted (email) messages to and from previously saved
users.

Gemfile

```ruby
gem 'secure_message'
```

```ruby
require 'secure_message'
SecureMessage.set_persistence :active_record

SecureMessage.deliver(
  from: "from@example.com",
  to:   "to@example.com",
  body: "unencrypted body"
)

```

Encryption
==========
First iteration will support PGP encryption

Persistence
===========
Default is that user information is persisted in an ActiveRecord 
`SecureMessage::UserPersistence` table: `user_persistences`

Local user(s) will have their private keys persisted too.
