require 'rails_helper'

feature "user can sign in and sign out" do

  context "user not signed in and visits homepage" do
    it "should see 'sign in', 'sign out'" do
      visit '/'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "shoudln\'t see a sign out link" do
      visit '/'
      expect(page).not_to have_link('Sign out')
    end

  end

  context "user is signed in and on the homepage" do

    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@test.es')
      fill_in('Password', with: 'pAssw0rd')
      fill_in('Password confirmation', with: 'pAssw0rd')
      click_button('Sign up')
    end

    it "should see signout link" do
      visit ('/')
      expect(page).to have_link('Sign out')
    end

    it "shouldn't see signup or signin link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

  end

end