require 'rails_helper'

feature 'User signs up' do
  scenario 'with valid params' do
    sign_up_with(name: 'David', email: 'test@test.com', password: '123123')
    expect(page).to have_content('Logged in as: David')
  end

  scenario 'without Name' do
    sign_up_with(name: '', email: 'test@test.com', password: '123123')
    expect(page).to have_content("Name can't be blank")
  end
end
