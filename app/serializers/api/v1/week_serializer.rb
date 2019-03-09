class Api::V1::WeekSerializer
  include FastJsonapi::ObjectSerializer
  has_many :goals
end
