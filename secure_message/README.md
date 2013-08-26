SecureMessage
=============


Enable sending of encrypted (email) messages to and from previously saved
users.

```ruby

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

Local user(s) will can have their private keys persisted too.
