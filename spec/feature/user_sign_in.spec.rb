require 'rails_helper'
RSpec.describe 'Create new User proccess', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'User Sign in' do
    user1 = User.create(name: 'erez', email: 'erezgo@gmail.com', password: '123456')
    visit root_path
    click_link_or_button 'Sign up'
    fill_in 'user[name]', with: user1.name
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Sign up'
    expect(page).to have_text('Sign up')
  end
end
