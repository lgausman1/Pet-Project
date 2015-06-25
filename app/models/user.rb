class User < ActiveRecord::Base
	validates_uniqueness_of :email

	has_many :user_pets
	has_many :pets, :through => :user_pets

	has_secure_password

	validates :password,
	length: {:minimum => 5},
	length: {:maximum => 20}

	validates :first_name, length: { maximum: 20 }

	serialize :survey_info
	def self.confirm (params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end
end
