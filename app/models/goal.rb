class Goal < ApplicationRecord
  validates :description, presence: true
end
