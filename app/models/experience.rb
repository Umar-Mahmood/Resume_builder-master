class Experience < ApplicationRecord
  belongs_to :resume, optional: true


  validates :title, presence: true
  validates :skills, presence: true
  validates :sart_date, presence: true
  validates :sart_date,
  :date => { :before => Time.now }
  validates :end_date, presence: true
  validates :end_date,
  :date => { :after => :sart_date, :before => Time.now }
end
