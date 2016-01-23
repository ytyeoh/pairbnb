CarrierWave.configure do |config|
#   config.fog_provider = 'fog/aws'                        # required
#   config.fog_credentials = {
#     provider:              'AWS',                        # required
#     aws_access_key_id:     'xxx',                        # required
#     aws_secret_access_key: 'yyy',                        # required
#     region:                'eu-west-1',                  # optional, defaults to 'us-east-1'
#     host:                  's3.example.com',             # optional, defaults to nil
#     endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
#   }
#   config.fog_directory  = 'name_of_directory'                          # required
#   config.fog_public     = false                                        # optional, defaults to true
#   config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
# end






  # CarrierWave.configure do |config|
  #   config.fog_provider = 'fog-google'                        # required
  #   config.fog_credentials = {
  #     provider:                         'Google',
  #     google_storage_access_key_id:     ENV['GMAIL_USERNAME'],
  #     google_storage_secret_access_key: ENV['GMAIL_PASS']
  #   }
  #   config.fog_directory = 'name_of_directory'
  # end
