# Carrierwave.configure do |config|
#   config.fog_credentials = {
#     :provider               => "AWS",
#     :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
#     :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY']
#   }

#   config.fog_directory = ENV['AWS_BUCKET']
#   config.fog_public    = false

# end



# require 'carrierwave/storage/fog'

# CarrierWave.configure do |config|

#   if Rails.env.development? || Rails.env.test?
#     config.storage = :file
#   else
#     config.fog_provider = 'fog/aws'
#     config.fog_credentials = {
#       provider: 'AWS',
#       aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
#       aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#       region: ENV['AWS_REGION'],
#       endpoint: 'https://s3.amazonaws.com'
#     }
#     config.fog_directory = ENV['AWS_BUCKET']
#     config.fog_public = false
#     config.storage = :fog
#   end
# end



# config/initializers/carrierwave.rb
# This file is not created by default so you might have to create it yourself.

require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  
  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end
  
  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end
  
  config.fog_credentials = {
    :provider               => 'AWS',                                         # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                        # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],                    # required
    :region                 => 'us-west-2'                        # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'tretrato-development'               # required
  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  #config.fog_public     = false                                  # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
