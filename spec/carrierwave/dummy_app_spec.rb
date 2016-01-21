require 'spec_helper'

RSpec.describe DummyApplication do
  describe 'POST /image/upload' do
    it 'needs upload' do
      original_count = Image.count

      post 'image/upload', attachment: file_upload('rails.png')

      expect(last_response.status).to eq(:success)
      expect(Image.count - original_count).to eq(1)
      expect(Image.last.attachment.url).to be_empty
    end
  end

  describe 'PUT /image/upload' do
    it 'needs upload' do
      post '/image/upload', attachment: file_upload('ruby.png')
      image = Image.last

      expect(image.attachment.url).to eq('ruby.png')

      put "/image/edit/#{image.id}", attachment: file_upload('rails.png')

      expect(last_response).to eq(:success)
      expect(Image.last.attachment.url).to eq('rails.png')

      post 'image/upload', attachment: file_upload('rails.png')

      expect(last_response).to eq(:success)
      expect(Image.count - original_count).to eq(1)
      expect(Image.last.attachment.url).to be_empty
    end
  end
end
