class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :resumes
  has_one_attached :avatar, dependent: :purge_later

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
