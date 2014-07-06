class Journey < ActiveRecord::Base

  extend FriendlyId
  friendly_id :obfuscated_id, use: :slugged

  belongs_to :user

  default_scope -> { order('updated_at DESC') }

  has_many :stops, dependent: :destroy

  accepts_nested_attributes_for :stops, allow_destroy: true

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "80x80>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true, length: { maximum: 30 }, uniqueness: { scope: :user }
  validates_associated :stops

end

