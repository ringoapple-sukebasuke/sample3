require 'rails_helper'


RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is valid with a name, email, and password" do
    user = User.new(
      name: "ringo",
      email: "ringo@gmail.com",
      password: "123456",
    )
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "ringo@gmail.com")
    user = FactoryBot.build(:user, email: "ringo@gmail.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "return a user's name as a string" do
    user = FactoryBot.build(:user, name: "ringo")
    expect(user.name).to eq "ringo"
  end
end
