class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :company, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :estimates, dependent: :destroy
  accepts_nested_attributes_for :company, allow_destroy: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, uniqueness:true, length:{ maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, length: { minimum: 6 },
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
