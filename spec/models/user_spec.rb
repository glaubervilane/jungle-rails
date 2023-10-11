require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.authenticate_with_credentials' do
    it 'should authenticate a user with spaces around the email' do
      user = User.create(email: 'example@domain.com', password: 'password')
      authenticated_user = User.authenticate_with_credentials(' example@domain.com ', 'password')
      expect(authenticated_user).to eq(user)
    end

    it 'should authenticate a user with different letter case in email' do
      user = User.create(email: 'example@domain.com', password: 'password')
      authenticated_user = User.authenticate_with_credentials('eXample@domain.COM', 'password')
      expect(authenticated_user).to eq(user)
    end
  end
end

