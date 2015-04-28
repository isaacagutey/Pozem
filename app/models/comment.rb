class Comment < ActiveRecord::Base
include Bootsy::Container

 belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
 belongs_to :post
 has_many :replies, dependent: :destroy

 validates :body, presence: true
end