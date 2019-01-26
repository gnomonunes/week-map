class Week < ApplicationRecord
  has_many :goals, dependent: :destroy
end
