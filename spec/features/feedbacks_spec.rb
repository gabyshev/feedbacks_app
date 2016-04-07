require 'rails_helper'

feature 'User sends feedback' do
  context 'logged in' do
    let(:user) { create :user }

    background { sign_in user: user }

    scenario 'Name is prefilled' do
      expect(find('#feedback_name').value).to eq user.name
    end

    scenario 'Message is required' do
      find_button('Create Feedback').click
      expect(page).to have_content "Message can't be blank"
    end

    scenario 'Success feedback sending' do
      fill_in 'Message', with: 'message'
      find_button('Create Feedback').click
      expect(page).to have_content('Thanks for your feedback!')
    end
  end

  context 'anonymous' do
    background { visit root_path }

    scenario 'Name is empty' do
      expect(find('#feedback_name').value).to be_nil
    end

    scenario 'Name is required' do
      find_button('Create Feedback').click
      expect(page).to have_content "Name can't be blank"
    end

    scenario 'Message is required' do
      find_button('Create Feedback').click
      expect(page).to have_content "Message can't be blank"
    end

    scenario 'Success feedback sending' do
      fill_in 'Name', with: 'name'
      fill_in 'Message', with: 'message'
      find_button('Create Feedback').click
      expect(page).to have_content('Thanks for your feedback!')
    end
  end
end
