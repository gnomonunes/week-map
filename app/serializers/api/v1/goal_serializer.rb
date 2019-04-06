class Api::V1::GoalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description
  belongs_to :week
end
