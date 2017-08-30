class Post < ActiveRecord::Base
	require 'sanitize'
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :body,  presence: true

	before_save :sanitize_body

	def sanitize_body
		Sanitize.fragment(body, Sanitize::Config::RELAXED)
	end
end