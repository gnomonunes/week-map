class Api::V1::WeeksController < ApplicationController
  def index
    @weeks = Week.all.includes(:goals)
    render_jsonapi @weeks
  end

  private

  def week_params
    params.require(:week).permit(:id, :goals)
  end
end