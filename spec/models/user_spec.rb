require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'valid' do
      let(:user) { build :user }
      it { expect(user).to be_valid }
    end

    context 'invalid' do
      let(:user) { build :user, email: '' }
      it { expect(user).to_not be_valid }
    end

    context 'email' do
      let!(:user) { create :user, email: 'email@test.com' }
      let(:new_user) { build :user, email: 'email@test.com' }

      it 'should be unique' do
        expect(new_user.save).to be_falsey
      end

      it 'should say error message' do
        expect(new_user.valid?).to be_falsey
        expect(
          new_user.errors.full_messages_for(:email)
        ).to eq ['Email has already been taken']
      end
    end
  end
end
