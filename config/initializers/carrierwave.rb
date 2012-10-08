CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: "S3_KEY",
    aws_secret_access_key: "S3_SECRET"
  }
  config.fog_directory = "S3_BUCKET"
end