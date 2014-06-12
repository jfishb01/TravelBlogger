class Stop < ActiveRecord::Base

  belongs_to :journey

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  # default_scope -> { order('created_at ASC') }

  # validates :title, presence: true, length: { maximum: 60 }, uniqueness: { scope: :journey }
  # validates :location, presence: true, length: { maximum: 256 }
  validates :latitude, presence: true,
    :numericality => { :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90 }
  validates :longitude, presence: true,
    :numericality => { :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180 }

end

