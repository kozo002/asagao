if Rails.env.test? || Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
else
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     Rails.application.secrets.aws_access_key_id,
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
      region:                'ap-northeast-1'
      #hosts:                's3.example.com'
      #endpoint:             'https://s3.example.com:8080'
    }
    config.fog_directory  = Rails.application.secrets.aws_s3_bucket
    config.fog_public     = true
    config.fog_authenticated_url_expiration = 1.day.to_i
    config.fog_attributes = {
      'Cache-Control' => "max-age=#{ 1.year.to_i }"
    }
  end
end
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
