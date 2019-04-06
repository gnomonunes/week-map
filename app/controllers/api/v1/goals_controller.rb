class Api::V1::GoalsController < ApplicationController
  before_action :set_week

  def index
    goals = @week.goals
    render_jsonapi goals
  end

  def create
    goal = @week.goals.create(goal_attributes)

    location = api_v1_week_goal_path({id: goal.id})
    render_jsonapi goal, status: :created, location: location
  end

  def show
    goal = Goal.find(params[:id])
    render_jsonapi goal
  end

  def update
    goal = Goal.find(goal_params[:id])
    goal.update_attributes(goal_attributes)

    location = api_v1_week_goal_path({id: goal.id})
    render_jsonapi goal, location: location
  end

  def destroy
    @week.goals.destroy(params[:id])
    render json: {message: "goal deleted!"}
  end

  private

  def set_week
    @week = Week.find(params[:week_id])
  end

  def goal_attributes
    goal_params[:attributes] || {}
  end

  def goal_params
    params.require(:data).permit(:type, :id, {
      attributes: [:description]
    })
  end
end