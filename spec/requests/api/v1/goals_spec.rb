require "rails_helper"

RSpec.describe "Api::V1::Goals", type: :request do
  let(:goal_show_path_regex) { /\/api\/v1\/weeks\/\d+\/goals\/\d+/ }
  let(:week) { FactoryBot.create(:week) }
  let(:goal) do
    FactoryBot.create(:goal, description: "do the laundry", week: week)
  end

  describe "GET /api/v1/weeks/:week_id/goals/:id" do
    it "returns a goal" do
      get "/api/v1/weeks/#{week.id}/goals/#{goal.id}"

      expect(response).to have_http_status(200)
      expect(response).to be_jsonapi_response_for("goal")
      expect(JSON.parse(response.body)["data"]["attributes"]["description"])
        .to eq("do the laundry")
    end
  end

  describe "POST /api/v1/weeks/:week_id/goals" do
    it "creates a goal" do
      post "/api/v1/weeks/#{week.id}/goals", {
        params: {
          data: {
            type: "goal",
            attributes: {
              description: "finish React training"
            }
          }
        }
      }

      expect(response).to have_http_status(201)
      expect(response.header["Location"]).to match(goal_show_path_regex)
      expect(response).to be_jsonapi_response_for("goal")
      expect(JSON.parse(response.body)["data"]["attributes"]["description"])
        .to eq("finish React training")
    end
  end

  describe "PUT /api/v1/weeks/:week_id/goals/:id" do
    it "updates a goal" do
      put "/api/v1/weeks/#{week.id}/goals/#{goal.id}", {
        params: {
          data: {
            id: goal.id,
            type: "goal",
            attributes: {
              description: "finish Redux training"
            }
          }
        }
      }

      expect(response).to have_http_status(200)
      expect(response.header["Location"]).to match(goal_show_path_regex)
      expect(response).to be_jsonapi_response_for("goal")
      expect(JSON.parse(response.body)["data"]["attributes"]["description"])
        .to eq("finish Redux training")
    end
  end

  describe "delete /api/v1/weeks/:week_id/goals/:id" do
    it "deletes a goal" do
      delete "/api/v1/weeks/#{week.id}/goals/#{goal.id}"

      expect(response).to have_http_status(204)
    end
  end
end
