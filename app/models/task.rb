class Task < ApplicationRecord
  validates :content, length: { maximum: 200 }, presence: true
  #validates :completed, inclusion: { in: %w(true false)},
  validates :completed, length: {maximum: 200}, allow_blank: true
end
