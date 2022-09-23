class Language < ApplicationRecord

  belongs_to :resume, optional: true

  enum level: [:biggner, :intermidiate, :professional, :native]
  validates :language, presence: true
  validates :level, presence: true
end
