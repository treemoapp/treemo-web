require 'rails_helper'

feature 'user can sign in and sign out' do

  context 'user is signed in and on the homepage' do
    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = {
        'provider'  => 'facebook',
        'uid'       => 12345,
        'info' => {
        'email' => 'email@email.com',
        'name'       => 'John Doe',
        'image'       => 'http://robohash.org/treemo'
        # any other attributes you want to stub out for testing
        }
      }
      visit root_path
    end

    it 'Add location button for signed in users only' do
      expect(page).not_to have_link('Add location')
      click_link 'Sign in with Facebook'
      expect(page).to have_link('Add location')
      click_link 'Sign out'
      expect(page).not_to have_link('Add location')
    end

    it "shouldn't see signup or signin link" do
      
    end
  end
end
