require 'rails_helper'

RSpec.describe "Companys", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/companys/index"
      expect(response).to have_http_status(:success)
    end
  end
end
