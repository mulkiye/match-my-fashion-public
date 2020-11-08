CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                            # required
    aws_access_key_id:     ENV["AWS_ACCESS_KEY"],            # required
    aws_secret_access_key: ENV["AWS_SECRET_KEY"],            # required
    region:                'us-east-1'
  }
  config.fog_directory = ENV["AWS_BUCKET"]                   # required
  config.fog_public    = false
  config.cache_dir.    = "#{Rails.root}/tmp/uploads"         # To let CarrierWave work on heroku

  # store files locally in test and development environments
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end
end

#CarrierWave.configure do |config|
#  config.ignore_integrity_errors = false
#  config.ignore_processing_errors = false
#  config.ignore_download_errors = false
#
#  if ENV.has_key? 'S3_KEY' and ENV.has_key? 'S3_SECRET'
#    puts "Image Host: AWS"
#    config.fog_provider = 'fog/aws'
#    config.fog_credentials = {
#      provider: 'AWS',
#      aws_access_key_id: ENV['S3_KEY'],
#      aws_secret_access_key: ENV['S3_SECRET'],
#    }
#    config.fog_directory = 'fashionnxt-cc'
#    config.storage = :fog
#  else
#    puts "Image Host: local filesystem"
#    config.storage = :file
#  end
#
#  config.cache_dir = "#{Rails.root}/tmp/uploads"
#end
