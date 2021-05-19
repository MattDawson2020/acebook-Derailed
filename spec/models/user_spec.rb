require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#authentication' do

    it 'hashes the password using Bcrypt' do
      expect(BCrypt::Password).to receive(:create).with("user_password", {:cost=>4})
      User.create(name: 'user', email: 'user@email.com', password: 'user_password')
    end

    it 'returns a user if correct username + password given' do
      user = User.create(name: 'user', email: 'user@email.com', password: 'user_password')
      authenticated_user = user.authenticate('user_password')
      expect(user.email).to eq authenticated_user.email
    end

  end

end
