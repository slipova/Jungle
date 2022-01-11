class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password, confirmation: { case_sensitive: true }
  validates :password_confirmation, presence: true
  validates :password_confirmation, confirmation: { case_sensitive: true }

end