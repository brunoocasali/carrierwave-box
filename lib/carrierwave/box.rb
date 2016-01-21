require 'carrierwave'
require 'carrierwave/storage/box'

require 'carrierwave/box/version'
require 'carrierwave/box/railtie' if defined?(Rails)

class CarrierWave::Uploader::Base
  add_config :box_app_key
  add_config :box_app_secret
  add_config :box_access_token
  add_config :box_access_token_secret
  add_config :box_user_id
  add_config :box_access_type

  configure do |config|
    config.storage_engines[:box] = 'CarrierWave::Storage::Box'
  end
end
