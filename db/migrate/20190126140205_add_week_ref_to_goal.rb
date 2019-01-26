class AddWeekRefToGoal < ActiveRecord::Migration[5.2]
  def change
    add_reference :goals, :week, foreign_key: true
  end
end
