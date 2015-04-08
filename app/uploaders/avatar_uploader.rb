class AvatarUploader < CarrierWave::Uploader::Base
  # include CarrierWave::MiniMagick

  # process resize_to_fit: [200, 200]

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallback/default.jpg")
  end
end
