class Education < ApplicationRecord

  belongs_to :resume, optional: true


  validates :degree, presence: true
  validates :institute, presence: true
  validates :major_subjects, presence: true
  validates :sart_date, presence: true
  validates :sart_date,
  :date => { :before => Time.now }
  validates :end_date, presence: true
  validates :end_date,
  :date => { :after => :sart_date, :before => Time.now }
end
