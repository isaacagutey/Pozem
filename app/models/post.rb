class Post < ActiveRecord::Base
 include Bootsy::Container

 mount_uploader :photo, PhotoUploader
 belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
 has_many :comments, dependent: :destroy
 has_many :replies, dependent: :destroy
 has_many :post_categories
 has_many :categories, through: :post_categories

 validates :title, presence: true
end