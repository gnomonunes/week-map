require 'rails_helper'

RSpec.describe "Api::V1::Goals", type: :request do
  let(:week) { FactoryBot.create(:week) }

  describe "POST /api/v1/weeks/:week_id/goals" do
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
      expect(response).to be_jsonapi_response_for('goal')
    end
  end
end
