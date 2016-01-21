require 'boxr'

##
# Public: CarrierWave Storage definition
module CarrierWave
  module Storage
    class Box < Abstract
      # Stubs we must implement to create and save
      # files (here on Dropbox)

      # Store a single file
      def store!(file)
        # location = (config[:access_type] == "dropbox") ?
        # "/#{uploader.store_path}" : uploader.store_path
        box_client.put_file(uploader.store_path, file.to_file)
      end

      # Retrieve a single file
      def retrieve!(file)
        CarrierWave::Storage::Box::File
          .new(uploader, config, uploader.store_path(file), box_client)
      end

      def box_client
        @box_client ||= Boxr::Client.new(config[:developer_token])
      end

      private

      def config
        @config ||= {}

        @config[:developer_token] ||= uploader.box_developer_token

        @config
      end

      class File
        include CarrierWave::Utilities::Uri
        attr_reader :path

        def initialize(uploader, config, path, client)
          @uploader = uploader
          @config = config
          @path = path
          @client = client
        end

        def url
          @client.media(@path)['url']
        end

        def delete
          @client.file_delete(@path)
        end
      end
    end
  end
end
