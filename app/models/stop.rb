class Stop < ActiveRecord::Base

  belongs_to :journey

  # geocoded_by :location
  # before_validation :geocode

  validates :title, presence: true, length: { maximum: 60 }, uniqueness: { scope: :journey }
  validates :location, presence: true, length: { maximum: 256 }, uniqueness: { scope: :journey }
  validates :latitude, presence: true,
    :numericality => { :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90 }
  validates :longitude, presence: true,
    :numericality => { :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180 }

end

