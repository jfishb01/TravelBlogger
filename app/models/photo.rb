class Photo < ActiveRecord::Base

  belongs_to :journey
  belongs_to :stop

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "80x80>" },
    :default_url => "/images/:style/missing.png",
    :url => "/stops/:hash.:extension",
    :path => "/stops/:hash.:extension",
    :hash_secret => SECRET_KEY3
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :caption, length: { maximum: 500 }
  validates :title, length: { maximum: 100 }

end

