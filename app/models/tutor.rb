# frozen_string_literal: true

class Tutor < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  belongs_to :course
end
