class Course < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :tutors
end
