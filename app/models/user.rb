class User < ActiveRecord::Base
	validates_uniqueness_of :email

	has_many :user_pets
	has_many :pets, :through => :user_pets

	has_secure_password

	validates :password, presence: true,
	length: {:minimum => 5},
	length: {:maximum => 20}

	validates :first_name, presence: true, length: { maximum: 20 }

	validates :last_name, presence: true, length: { maximum: 25 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

	serialize :survey_info
	def self.confirm (params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end
end

