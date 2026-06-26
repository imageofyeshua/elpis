class User < ApplicationRecord
  # If you want secure password features (like Rails' built-in has_secure_password)
  # Uncomment the line below (requires the 'bcrypt' gem in your Gemfile)
  # has_secure_password

  # Clean up data before saving
  before_save { self.email = email.downcase.strip }

  # Validations
  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
