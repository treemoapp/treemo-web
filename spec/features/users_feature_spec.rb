require 'rails_helper'
require 'byebug'

feature 'user can sign in and sign out' do
  context 'user not signed in and visits homepage' do
    it 'should see Sign in with Facebook' do
      visit root_path
      expect(page).to have_link('Sign in with Facebook')
    end

    it "shoudln\'t see a sign out link" do
      visit '/'
      expect(page).not_to have_link('Sign out')
    end
  end

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

    it 'should see signout link and user name' do
      click_link 'Sign in with Facebook'
      expect(page).to have_link('Sign out')
      expect(page).to have_content('John Doe')
      click_link 'Sign out'
      expect(page).to have_link('Sign in with Facebook')
    end

    it "shouldn't see signup or signin link" do
      click_link 'Sign in with Facebook'
      expect(page).not_to have_link('Sign in with Facebook')
    end
  end
end

feature 'user can see how many checkins have been made at their locations' do
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
      click_link 'Sign in with Facebook'
      20.times do |i|
        User.first.locations.create
        Checkin.create(user: User.first, location: Location.first)
      end
    end
      it 'can click through to a page showing number of checkins' do
      visit '/'
      click_link 'View your profile'
      expect(page).to have_content "20 people have checked in"
    end
  end
end
