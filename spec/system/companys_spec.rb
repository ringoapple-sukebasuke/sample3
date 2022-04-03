require 'rails_helper'

RSpec.describe "Companys", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "user creeates a new company" do
    user = FactoryBot.create(:user)

    visit root_path
    click_link "ログイン"
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect do
      click_link "企業登録"
      fill_in "number", with: "1111"
      fill_in "name", with: "Trying out Capybara"
      fill_in "total", with: "1"
      fill_in "dividend", with: "1.0"
      fill_in "information", with: "Trying out Capybara"
      click_button "投稿"
    end.to change(user.companys, :count).by(1)
  end
end
