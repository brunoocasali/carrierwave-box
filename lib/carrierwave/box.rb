require 'carrierwave'
require 'carrierwave/storage/box'

require 'carrierwave/box/version'

module CarrierWave
  module Uploader
    class Base
      add_config :box_developer_token

      configure do |config|
        config.storage_engines[:box] = 'CarrierWave::Storage::Box'
      end
    end
  end
end
