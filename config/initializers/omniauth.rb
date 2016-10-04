

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['517070085158972'], ENV['626ed1828fffcb7720e917a0685a5c5e']
end
