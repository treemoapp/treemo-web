class Location < ActiveRecord::Base
  belongs_to :user
  acts_as_mappable distance_field_name: :distance
  has_many :checkins, dependent: :destroy
end
