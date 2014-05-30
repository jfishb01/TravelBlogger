class Blog < ActiveRecord::Base

  belongs_to :user

  default_scope -> { order('updated_at DESC') }

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "80x80>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true, length: { maximum: 30 }, uniqueness: { scope: :user}

end

