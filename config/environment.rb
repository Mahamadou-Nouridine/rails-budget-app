# Load the Rails application.
require_relative "application"

config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present? || ENV['RENDER'].present?
# Initialize the Rails application.
Rails.application.initialize!
