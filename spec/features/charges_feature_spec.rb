require 'rails_helper'

feature 'User Makes Payment' do
  context 'user is signed and visits the homepage' do
    it 'should see Your Account' do
      visit root_path
      expect(page).to have_link('Your Account')
    end
  end
end