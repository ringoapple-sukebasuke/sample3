require 'rails_helper'

RSpec.describe "Companys", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:company) { FactoryBot.create :company, owner: user }

  describe "#index" do
    context "as a authenticated user" do
      it "responds successfully returns a 200 response" do
        sign_in user
        get companys_path
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get companys_path
        expect(response).to have_http_status "302"
      end
      it "redirects to the sign-in page" do
        get companys_path
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#show" do
    it "responds succesfully" do
      sign_in user
      get companys_path, params: { id: company.id }
      expect(response).to be_successful
    end
  end

  describe "#create" do
    it "returns a 302 response" do
      company_params = FactoryBot.attributes_for(:company)
      post companys_path, params: { company: company_params }
      expect(response).to have_http_status "302"
    end
    it " redirects to the sign-in page" do
      company_params = FactoryBot.attributes_for(:company)
      post companys_path, params: { company: company_params }
      expect(response).to redirect_to "/users/sign_in"
    end
  end

  describe "#update" do
    context "as an authorized user" do
      it "updates a company" do
        company_params = FactoryBot.attributes_for(:company, name: "MyString")
        sign_in user
        patch company_url company, params: { id: company.id, company: company_params }
        expect(company.reload.name).to eq "MyString"
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        company_params = FactoryBot.attributes_for(:company)
        patch company_url company, params: { company: company_params }
        expect(response).to have_http_status "302"
      end
      it "redirects to the sign_in page" do
        company_params = FactoryBot.attributes_for(:company)
        patch company_url company, params: { company: company_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#destroy" do
    it "returns a 302 response" do
      company_params = FactoryBot.attributes_for(:company)
      delete company_url company, params: { company: company_params }
      expect(response).to have_http_status "302"
    end
    it "redirects to the sign-in page" do
      company_params = FactoryBot.attributes_for(:company)
      delete company_url company, params: { company: company_params }
      expect(response).to redirect_to "/users/sign_in"
    end
  end
end
