class User < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = ^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$
	validates :email, format: { with: VALID_EMAIL_REGEX }
end
