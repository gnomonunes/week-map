class Api::V1::WeekSerializer
  include FastJsonapi::ObjectSerializer
  attributes :goals
  has_many :goals
end
