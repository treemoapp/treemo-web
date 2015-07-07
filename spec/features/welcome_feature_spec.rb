require 'rails_helper'
require 'byebug'

feature 'user can sign in and sign out' do
  context 'user signed in and visits homepage' do

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
      click_link 'Sign in with Facebook'

      # byebug
    end

    it 'prompts user to add a location' do
      visit root_path
      expect(page).to have_css('div#add-location')
      expect(page).not_to have_css('div#chart-1')
    end


    it 'sees stats graph' do
      Location.create(user: User.first, name: 'Trade')
      Checkin.create(user: User.first, location: Location.first)
      visit root_path
      expect(page).to have_content('1 location')
      expect(page).to have_content('1 checkin all time')
      expect(page).to have_content('Trade')
      expect(page).to have_css('div#chart-1')
    end

  end
  end
