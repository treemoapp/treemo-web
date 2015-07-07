require 'rails_helper'

feature 'user can sign in and sign out' do
  context 'user not signed in and visits homepage' do
    it 'sees sign in with Facebook & carousel' do
      visit root_path
      expect(page).to have_link('Sign in with Facebook')
      expect(page).to have_css('div#myCarousel')
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
      expect(page).not_to have_css('div#myCarousel')
      click_link 'Sign out'
      expect(page).to have_link('Sign in with Facebook')
      expect(page).to have_css('div#myCarousel')
    end

    it "shouldn't see signup or signin link" do
      click_link 'Sign in with Facebook'
      expect(page).not_to have_link('Sign in with Facebook')
    end
  end
end
