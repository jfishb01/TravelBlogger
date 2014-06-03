class Stop < ActiveRecord::Base

  belongs_to :journey

  geocoded_by :location
  before_validation :geocode

  validates :title, presence: true, length: { maximum: 60 }, uniqueness: { scope: :journey }
  validates :location, presence: true, length: { maximum: 128 }, uniqueness: { scope: :journey }
  validates :latitude, presence: true, uniqueness: { scope: :journey }
  validates :longitude, presence: true, uniqueness: { scope: :journey }

end

