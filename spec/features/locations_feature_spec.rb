require 'rails_helper'

feature 'user can sign in and sign out' do
  context 'user is signed in and on the homepage' do
    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = {
        'provider'  => 'facebook',
        'uid'       => 12_345,
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
  end
  context 'Locations belong to a user' do
    it 'new location belongs to user' do
      visit '/'
      click_link 'Sign in with Facebook'
      user = User.first
      click_link('Add location')
      fill_in 'Facebook', with: 123_456_789
      fill_in 'Name', with: 'Trade'
      fill_in 'Lat', with: 51.517461
      fill_in 'Lng', with: -0.073387
      click_button 'Create Location'
      expect(page).to have_content('Location was successfully created.')
      location = Location.last
      expect(location.name).to eq 'Trade'
      expect(location.user).to eq user
    end
  end
  context 'Only logged in users can see locations controller' do
    it 'tells user to sign in' do
      OmniAuth.config.mock_auth[:facebook] = nil
      visit '/locations/new'
      expect(page).not_to have_content('New location')
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
