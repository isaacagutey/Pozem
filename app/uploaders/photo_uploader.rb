class PhotoUploader < CarrierWave::Uploader::Base

	include CarrierWave::RMagick

	storage :file

	include CarrierWave::MimeTypes
	process :set_content_type

	def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  	end

  	version :thumb do   
     process :resize_to_fit => [650, 400]
  	end
  	
end
