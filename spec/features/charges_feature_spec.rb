require 'rails_helper'

require_relative 'helpers'
include Helpers

feature 'User Makes Payment' do
  context 'user is signed and visits the homepage' do
    before do
      set_omniauth_mocks
      add_location
    end
    xit 'should see Your Account' do
      save_and_open_page
      sleep(2) # allows stripe_checkout_app frame to load
      expect(page).to have_button('Buy 500 credits for £100')
    end
  end
end

