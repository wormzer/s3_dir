module S3Lib
  class Dir
    def self.dir_mode(mode)
      if mode.is_a?(String)
        mode =~ /^0/ || mode = "0#{mode}"
      elsif mode.to_s == mode.to_s(10)
        # Mode is in Fixnum::base 10
        mode = mode.to_s
      else
        mode = mode.to_s(8)
      end

      (-3..-1).each do |i|
        mode[i] = mode[i] + 1 if !mode[i].zero? && mode.even?
      end
      mode
    end

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
