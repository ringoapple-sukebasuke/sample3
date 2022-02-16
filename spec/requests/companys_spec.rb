require 'rails_helper'

RSpec.describe "Companys", type: :request do
  describe "#index" do
    context "as a authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end
      it "responds successfully returns a 200 response" do
        sign_in @user
        get companys_path
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end
    end
  end
end
