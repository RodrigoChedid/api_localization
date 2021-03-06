Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
      headers: :any,
      expose: %w[acess-token expiry token-type uid client],
      methods: %i[get post put delete options]
  end
end
