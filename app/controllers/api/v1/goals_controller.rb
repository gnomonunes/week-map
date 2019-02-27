class Api::V1::GoalsController < ApplicationController
  before_action :set_week, only: :create

  def create
    goal = @week.goals.create(goal_params)
    render json: goal
  end

  private

  def set_week
    @week = Week.find(params[:week_id])
  end

  def goal_params
    params.require(:goal).permit(:description)
  end
end