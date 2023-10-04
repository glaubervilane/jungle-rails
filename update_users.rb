# Load your Rails environment
require File.expand_path('config/environment')

require 'bcrypt'

# Replace 'your_password_here' with the secure password
new_password = BCrypt::Password.create('Password123')

# Update user records with the new password hash
User.all.each do |user|
  user.update(password_digest: new_password)
end

