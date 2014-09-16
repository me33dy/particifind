class User < ActiveRecord::Base

	attr_accessor :password

  has_many :posts
  
	validates :username, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, :presence =>true, :confirmation => true, :length => { :within => 6..40 }, :on => :create

  validates :password, :confirmation => true, :length => { :within => 6..40 }, :on => :update, :unless => lambda{ |user| user.password.blank? } 

  before_save :hash_password

  before_save { self.email = email.downcase }

	def authenticate(password)
	 self.hashed_password == BCrypt::Engine.hash_secret(password, self.salt)
	end

	private
	# method to generate store salt, hash user password, set password field nil since no such attribute in database
	def hash_password
		self.salt = BCrypt::Engine.generate_salt
		self.hashed_password = BCrypt::Engine.hash_secret(self.password, self.salt)
		self.password = nil
	end

end
