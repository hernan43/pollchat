# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pollchat_session',
  :secret      => 'c53fcd6aa8c90a07da86bc2e342e37129a660ee10be81f436848c860ccf0a9f139c672e40ce64c5df0b2f9a1bb9d27d5cc03882e04763df9bfb0f5577c20544d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
