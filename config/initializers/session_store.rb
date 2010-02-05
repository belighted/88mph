# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_flux_session',
  :secret => '1889ab8a4070b5869a7e632b9bfe4aa2bd3e381cdb398f04c2c8163b8cc1dcc30d4d539f57b4f56e9d55ebb7b6e49469853889437a81d6a88a5e5cf859da1d2f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
