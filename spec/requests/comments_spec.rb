require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:comment) { FactoryBot.create :comment, owner: user }

  describe "#create" do
    it "returns a 302 response" do
      comment_params = FactoryBot.attributes_for(:comment)
      post companys_path, params: { comment: comment_params }
      expect(response).to have_http_status "302"
    end
    it " redirects to the sign-in page" do
      comment_params = FactoryBot.attributes_for(:comment)
      post companys_path, params: { comment: comment_params }
      expect(response).to redirect_to "/users/sign_in"
    end
  end
end
