class Api::V1::WeeksController < ApplicationController
  def index
    render json: {goals: Goal.all}
  end

  private

  def week_params
    params.require(:week).permit(:id, :goals)
  end
end