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
        @box_client ||= Boxr::Client.new(refresh_token: config[:refresh_token],
                                        client_id: config[:client_id],
                                        client_secret: config[:client_secret],
                                        enterprise_id: config[:enterprise_id],
                                        jwt_private_key: config[:jwt_private_key],
                                        jwt_private_key_password: config[:jwt_private_key_password],
                                        jwt_public_key_id: config[:jwt_public_key_id],
                                          identifier: nil,
                                          as_user: nil,)
      end

      private

      def config
        @config ||= {}

        @config[:client_secret] ||= uploader.box_client_secret
        @config[:client_id] ||= uploader.box_client_id
        @config[:enterprise_id] ||= uploader.box_enterprise_id
        @config[:refresh_token] ||= uploader.box_refresh_token
        @config[:jwt_private_key] ||= uploader.box_jwt_private_key
        @config[:jwt_private_key_password] ||= uploader.box_jwt_private_key_password
        @config[:identifier] ||= uploader.box_identifier
        @config[:as_user] ||= uploader.box_as_user

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
