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
        box_client.upload_file(file.to_file, uploader.store_path)
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
          @client.download_url(@path)
        end

        def delete
          @client.delete_file(@path)
        end
      end
    end
  end
end
