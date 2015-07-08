module Helpers

  def add_location
    visit root_path
    click_link 'Sign in with Facebook'
    click_link 'Add a location now >>'
    fill_in 'Facebook', :with => '5768468'
    fill_in 'Name', :with => 'My shop'
    fill_in 'Lat', :with => '0.0'
    fill_in 'Lat', :with => '0.0'
    click_button 'Create Location'
  end

  def set_omniauth_mocks
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
  end

end