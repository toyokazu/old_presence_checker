# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cse-computer-network_session',
  :secret      => '67dfa82bb9a7ce1196d6907f531d9edd9ec845da8f3da169db8ec86f74c2df561462b94575dbbca30e1db0d2d77924aa47c2d65cb605b8983534436ad87130c7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
