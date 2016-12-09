Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, ENV['VK_KEY'], ENV['VK_SECRETS'], {scope: 'email'}
end