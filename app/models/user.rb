class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 6 }, if: -> { password.present? }
  validates :password_confirmation, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    user = find_by('LOWER(email) = ?', email.strip.downcase)
    user&.authenticate(password)
  end
end
