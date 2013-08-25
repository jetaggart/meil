Principles
____________

* Encryption as default
* Swappable encryption
* Upgrade plan for clients (backwards compatibility vs security risk etc)
* Clients have list of supported encryption algorithms, that gradually/rapidly get deprecated, in a way which tries to move users through the upgrade path simply. E.g. automatic updates à la Chrome etc.
* Distributed
* Everything is GPL
* Everything is open codewise
* Everything can be encrypted data-wise
* We are open in order for you to see that we are respecting your privacy
* Different implementations can easily talk to each other
* We need to make it impossible for one single group/org to own it. There must
  always be the ability for someone do do it better and allow people to switch.



Problems
____________
* Main providers of software clients pressured by governments to support or
  enforce weak algorithms.
* Someone's network would be the weakest link in the chain. Particularly, when that broadcasts all messages of a certain type to all interested parties.
  * E.g. nefarious agent sets up email account innocent-friend@not-the-nsa.gov.us, finds picture of a family member of "Mr Snowdonia", befriends Edwin's grandmother, "Mrs Snowdonia", who's using broken encryption and overly familiar privacy settings - allow readings of all Edwin's travel details around Moscovia.

Email
____________
  * Multi-part email
    * Plain text (for non-encrypted), suggestion via simple UI on non encrypted. E.g. faint red background with unlocked key means unencrypted. Alerts user before sending that they are going to send unencrypted text.
    * Encrypted text (headers for encryption algorithm/version). UI is plain text with a simple lock, showing as green = locked.
    * Informative section of email, with nice wording aimed at describing how to easily download trusted software that enables reading of encrypted text. 
    * Strong suggestions via UI about trade-offs of security vs accessibility for your grandma.
  

Typical usage patterns
______________________

* Web app. Vulnerable to interception by governments, have to take the Kim Dotcom approach of not even enabling server admins to access content.
* Desktop app. Upgrade path here is critical (for security conscious users). Plus possibility of upgrade protocol being hacked, desktop app having exploitable weaknesses, centralized point of failure for simple server client based downloads. Maybe another, advanced P2P trust based algorithm à la Bitcoin would be possible.
* Web client, gmail etc.

Guesses at Typical Users
________________________

* Hacker. Wants to be involved in creation, understands necessity and wants to try it out. Active contribution to development. Doesn't necessarily have a _need_ for the privacy etc.
* Early adopter. Has no particular need for high levels of near unbreakable privacy/security but enjoys doing so. Prepared to get hands dirty installing software, hacking around, may not contribute to actual development. Raises bugs.
* Tech-savvy Revolutionary/enemy of the state. Same usage patterns as above, but absolutely requires security/privacy. 
* Non-tech user/revolutionary etc in China/Iran, etc. Wants protection from government etc. Needs simple UX, may get hands dirty out of sheer necessity.
* Tech savvy version of the above, prepared to get involved etc, but has a language barrier to doing so.
* Ordinary, facebook-savvy, 24 year old, understands enough about tech to want to move away from centralised data control, but wants it to be easy to do. Bought into the idea, but won't invest time/money/resources in doing anything beyond a couple of downloads.
* Ordinary facebook user, will leave facebook if the crowd do, and it's incredibly simple to do. Will be scared off by download sites that look spammy, nonetheless, knows how to install programs. Expects a trust-worthy seeming UX.
* Grandma on facebook/email. Much more resistent to change. Doesn't understand security implications. May not need them. Will have grandson/son install 'the new facebook'. "What's wrong with the old one?". Possible point of weakness.

General thoughts
________________
Email ping between clients, enables gathering info on what latest known security protocols are for each client. Can convey in UI when communicating with individual
  * "Grandma is using an outdated version of GPG - your communications may not be safe" or whatever the recommended way is for trying to convey this type of information to users.
