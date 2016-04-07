require 'rails_helper'

feature 'User signs in' do
  scenario 'with valid params' do
    sign_in
    expect(page).to have_content('Logged in as:')
  end

  context 'and able to' do
    scenario 'logout through control bar' do
      sign_in
      expect(page).to have_link('Logout')
      click_link('Logout')
      expect(page).to have_content('Signed out successfully.')
    end
  end
end
