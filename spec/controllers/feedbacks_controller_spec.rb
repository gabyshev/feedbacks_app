require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
  describe '.index' do
    context 'anonymous' do
      it 'should be success' do
        get :index
        expect(response).to be_success
      end
    end

    context 'sighned user' do
      let(:user) { create :user }

      before do
        sign_in user
        get :index
      end

      it 'should be success' do
        expect(response).to be_success
      end
    end
  end
end
