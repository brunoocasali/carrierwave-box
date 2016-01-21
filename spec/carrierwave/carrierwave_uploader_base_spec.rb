require 'spec_helper'

RSpec.describe 'base' do
  describe '#configure' do
    it 'respond_to storages' do
      object = CarrierWave::Uploader::Base

      object.configure do |c|
        expect(c.storage_engines).to have_key(:file)
        expect(c.storage_engines).to have_key(:box)
      end

      expect(object).to respond_to(:box_developer_token)
    end
  end
end
