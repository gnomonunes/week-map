require 'rails_helper'

RSpec.describe "Api::V1::Goals", type: :request do
  let(:week) { FactoryBot.create(:week) }
  let(:goal) { FactoryBot.create(:goal) }
  let(:goal_show_path_regex) { /\/api\/v1\/weeks\/\d+\/goals\/\d+/ }

  describe "POST /api/v1/weeks/:week_id/goals" do
    # let(:week) { FactoryBot.create(:week) }
    it "creates a goal" do
      post "/api/v1/weeks/#{week.id}/goals", {
        params: {
          data: {
            type: 'goal',
            attributes: {
              description: "water plants"
            }
          }
        }
      }

      expect(response).to have_http_status(201)
      expect(response.header['Location']).to match(goal_show_path_regex)
      expect(response).to be_jsonapi_response_for('goal')
    end
  end

  describe "PUT /api/v1/weeks/:week_id/goals/:id" do
    it "updates a goal" do
      # binding.pry
      put "/api/v1/weeks/#{week.id}/goals/#{goal.id}", {
        params: {
          data: {
            id: goal.id,
            type: 'goal',
            attributes: {
              description: "water plants"
            }
          }
        }
      }

      expect(response).to have_http_status(200)
      expect(response.header['Location']).to match(goal_show_path_regex)
      expect(response).to be_jsonapi_response_for('goal')
    end
  end
end
