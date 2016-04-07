require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
  describe '.index' do
    context 'anonymous user' do
      it 'should be success' do
        get :index
        expect(response).to be_success
      end
    end

    context 'logged user' do
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

  describe '.create' do
    context 'valid params' do
      let(:feedback_params) do
        { feedback: { name: 'name', message: 'message' } }
      end

      it 'should redirect feedbacks page' do
        post :create, feedback_params
        expect(response.code).to eq '302'
      end
    end

    context 'invalid params' do
      let(:feedback_params) do
        { feedback: { name: '', message: '' } }
      end

      it 'should redirect feedbacks page' do
        post :create, feedback_params
        expect(response.code).to eq '400'
      end
    end
  end
end
