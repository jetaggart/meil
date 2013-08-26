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

SecureMessage.deliver(
  from: "from@example.com",
  to:   "some-pre-saved-user@example.com",
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

The `lib/secure_message/active_record/` folder contains the DAO, which
should allow for swapping out for different storage relatively easily.
