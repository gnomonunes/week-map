class Goal < ApplicationRecord
  belongs_to :week
  validates :description, presence: true
end
