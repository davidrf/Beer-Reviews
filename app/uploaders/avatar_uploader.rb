class AvatarUploader < CarrierWave::Uploader::Base

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
    enable_processing = false
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path("fallback/default.jpg")
  end
end
