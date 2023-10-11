require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be created with valid attributes' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'should not be valid without a first name' do
      user = User.new(
        last_name: 'Doe',
        email: 'john@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'should not be valid without a last name' do
      user = User.new(
        first_name: 'John',
        email: 'john@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'should not be valid without an email' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'should not be valid without a password' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    it 'should not be valid without a matching password confirmation' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        password: 'password',
        password_confirmation: 'differentpassword'
      )
      expect(user).to_not be_valid
    end

    it 'should not be valid with a duplicate (case-insensitive) email' do
      user = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      duplicate_user = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'JOHN@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(duplicate_user).to_not be_valid
    end

    it 'should have a password with a minimum length of 6 characters' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        password: 'passw',
        password_confirmation: 'passw'
      )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate a user with spaces around the email' do
      user = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      authenticated_user = User.authenticate_with_credentials(' john@example.com ', 'password')
      expect(authenticated_user).to eq(user)
    end

    it 'should authenticate a user with different letter case in email' do
      user = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      authenticated_user = User.authenticate_with_credentials('JOHN@example.com', 'password')
      expect(authenticated_user).to eq(user)
    end
  end
end

