require 'rails_helper'

RSpec.describe Checkin, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :location }


end
