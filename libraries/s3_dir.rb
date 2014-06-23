module S3Lib
  class Dir
    def connection
      @connection ||= begin
        require 'fog'

        Fog::Storage::AWS.new(
          aws_access_key_id: @access_key_id,
          aws_secret_access_key: @secret_access_key,
          path_style: true
        )
      end
    end

    def initialize(access_key_id, secret_access_key)
      @access_key_id = access_key_id
      @secret_access_key = secret_access_key
    end

    def ls(bucket, dir)
      dir.sub!(/\/$/, '')
      dir.sub!(/^\//, '')

      bucket_obj = connection.directories.get(bucket)
      listing = bucket_obj.files.select { |o| o.key =~ /^#{Regexp.escape(dir)}/ }
      listing = listing.reject { |o| o.key == "#{dir}/" }
      listing.map { |o| o.key.sub(/#{Regexp.escape(dir)}/, '') }
    end
  end
end
