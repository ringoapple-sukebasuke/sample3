require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "#top" do
    it "responds successfully returns a 200 response" do
      get root_path
      expect(response).to be_successful
    end
    it "returns a 200 response" do
      get root_path
      expect(response).to have_http_status "200"
    end
  end
end