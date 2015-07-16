S3DirectUpload.config do |c|
  c.access_key_id = "AKIAJSZ5CYHCODX537KA"       # your access key id
  c.secret_access_key = "AjNwKnC9uRZffg7Uf/wWSp5NHJuujLOiyj4KIcJd"   # your secret access key
  c.bucket = "turntotechrails"              # your bucket name
  c.region = 'us-west-2'             # region prefix of your bucket url. This is _required_ for the non-default AWS region, eg. "s3-eu-west-1"
  c.url = nil                # S3 API endpoint (optional), eg. "https://#{c.bucket}.s3.amazonaws.com/"
end