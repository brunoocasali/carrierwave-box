require 'carrierwave'
require 'carrierwave/storage/box'

require 'carrierwave/box/version'

module CarrierWave
  module Uploader
    class Base
      add_config :box_client_secret
      add_config :box_client_id
      add_config :box_enterprise_id
      add_config :box_refresh_token
      add_config :box_jwt_private_key
      add_config :box_jwt_private_key_password
      add_config :box_identifier
      add_config :box_as_user

      configure do |config|
        config.storage_engines[:box] = 'CarrierWave::Storage::Box'
      end
    end
  end
end
