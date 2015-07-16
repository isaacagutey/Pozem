class PhotoUploader < CarrierWave::Uploader::Base

	include CarrierWave::RMagick

	include CarrierWave::MimeTypes
	process :set_content_type

  	version :thumb do   
     process :resize_to_fit => [650, 400]
  	end
  	
    def extension_white_list
      %w(jpg jpeg gif png)
    end
end
