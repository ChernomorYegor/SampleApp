class Micropost < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size

  default_scope -> { order(created_at: :desc) }

  mount_uploader :picture, PictureUploader

  private
	# Validates the size of an uploaded picture.
	def picture_size
		debugger
		if picture.size > 2.megabytes
			errors.add(:picture, "should be less than 2MB")
		end
	end
end
