class Stop < ActiveRecord::Base

  belongs_to :journey

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  default_scope -> { order('start_date ASC, end_date ASC') }

  validates :title, presence: true, length: { maximum: 60 }, uniqueness: { scope: :journey }
  validates :location, presence: true, length: { maximum: 256 }
  validates :start_date, presence: true, uniqueness: { scope: :journey,
    :message =>  "must be unique. (Only one stop per day)." }
  validates :end_date, presence: true
  validates :latitude, presence: true,
    :numericality => { :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90 }
  validates :longitude, presence: true,
    :numericality => { :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180 }


  def next
    self.class.where("start_date > ? AND id != ? AND journey_id = ?", start_date, id, journey_id).first
  end

  def previous
    self.class.unscoped.where("start_date < ? AND id != ? AND journey_id = ?", start_date, id, journey_id).order("start_date DESC, end_date DESC").first
  end
end

