require 'rails_helper'

RSpec.describe Location, type: :model do
  it { is_expected.to belong_to :user }

  it 'should accept facebook ids' do
    Location.create(facebook_id: 123456789012346)
    expect(Location.last.facebook_id).to be 123456789012346
  end
end
