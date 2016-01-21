$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
ENV['RACK_ENV'] = 'test'

require 'carrierwave/box'
require 'rack/test'
require 'rspec'

require 'pry'
require 'support/dummy_app'

module RSpecMixin
  include Rack::Test::Methods

  def app() Sinatra::Application end

  def file_upload(image)
    path = File.expand_path("../support/fixtures/#{image}", __FILE__)
    Rack::Test::UploadedFile.new(path, 'image/png')
  end
end

RSpec.configure do |config|
  config.include RSpecMixin
end
