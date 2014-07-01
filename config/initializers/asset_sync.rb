if defined?(AssetSync)
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.fog_directory = Rails.application.secrets.aws_s3_bucket
    config.aws_access_key_id = Rails.application.secrets.aws_access_key_id
    config.aws_secret_access_key = Rails.application.secrets.aws_secret_access_key
    config.existing_remote_files = 'delete'
    config.fog_region = 'ap-northeast-1'
    config.gzip_compression = true
    config.manifest = true
    config.fail_silently = true
  end
end
