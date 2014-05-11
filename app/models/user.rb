class User < ActiveRecord::Base

  default_scope -> { order('last_name ASC, first_name ASC, email ASC') }

  has_many :trips, dependent: :destroy

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :email, length: { maximum: 60 }
  validates :password, length: { minimum: 6, maximum: 30 }, on: :create
  validates :password, length: { minimum: 6, maximum: 30 }, on: :update, allow_blank: true
  validates :terms_of_service, :allow_nil => false, acceptance: true, on: :create
  validates_associated :trips
  accepts_nested_attributes_for :trips, allow_destroy: true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

