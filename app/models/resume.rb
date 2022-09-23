class Resume < ApplicationRecord
  belongs_to :user

  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :languages, dependent: :destroy

  has_one_attached :picture, dependent: :purge_later

  after_create_commit :add_serial_number_to_resume
  accepts_nested_attributes_for :experiences, allow_destroy: true, :reject_if => :all_blank
  accepts_nested_attributes_for :educations, allow_destroy: true, :reject_if => :all_blank
  accepts_nested_attributes_for :languages, allow_destroy: true, :reject_if => :all_blank

  validates :first_name, presence: true, length: {minimum: 3, maximum: 20}
  validates :picture, presence: true
  validates :last_name, presence: true, length: {minimum: 3, maximum: 20}
  validates :discription, presence: true, length: {minimum: 20, maximum: 500}
  validates :phone, presence: true, length: {minimum: 9, maximum: 15}
  validates :adress, presence: true
  validates :designation, presence: true
  validates :skills, presence: true
  validates :email,presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def add_serial_number_to_resume
    self.serial_number = "PM-#{user_id}-#{id}"
    self.save
  end
end
