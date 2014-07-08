class User < ActiveRecord::Base

  extend FriendlyId
  friendly_id :obfuscated_id, use: :slugged

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable

  # default_scope -> { order('last_name ASC, first_name ASC, email ASC') }

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "80x80>" },
    :default_url => "/images/:style/missing.png",
    :url => "/users/:hash.:extension",
    :path => "/users/:hash.:extension",
    :hash_secret => ENV['SECRET_KEY1']
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :journeys, dependent: :destroy

  accepts_nested_attributes_for :journeys, allow_destroy: true

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :email, length: { maximum: 60 }
  validates :password, length: { minimum: 6, maximum: 32,
      :message => "6-32 characters"  },
      on: :update, allow_blank: true
  validates :terms_of_service, :allow_nil => false, acceptance: true, on: :create
  validates_associated :journeys

end

