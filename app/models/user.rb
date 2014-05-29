class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable

  default_scope -> { order('last_name ASC, first_name ASC, email ASC') }

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "80x80>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # has_many :trips, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :email, length: { maximum: 60 }
  validates :password, length: { minimum: 6, maximum: 32,
      :message => "6-32 characters"  },
      on: :update, allow_blank: true
  validates :terms_of_service, :allow_nil => false, acceptance: true, on: :create
  # validates_associated :trips
  # accepts_nested_attributes_for :trips, allow_destroy: true

end

