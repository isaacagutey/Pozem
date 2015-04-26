class Reply < ActiveRecord::Base
	belongs_to :creater, foreign_key: 'user_id', class_name: 'User' 
	belongs_to :post
	belongs_to :comment

	validates :body, presence: true

end