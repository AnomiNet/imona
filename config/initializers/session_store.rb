# Be sure to restart your server when you modify this file.

# Expires some time close to 2038, see integer overflow and permanent cookies
Rails.application.config.session_store :cookie_store, key: '_imona_session', expire_after: 22.years
