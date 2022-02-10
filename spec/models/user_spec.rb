require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, and password" do
    user = User.new(
      name: "ringo",
      email: "ringo@gmail.com",
      password: "123456",
    )
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid with a duplicate email address" do
    User.create(
      name: "ringo",
      email: "ringo@gmail.com",
      password: "123456",
    )
    user = User.new(
      name: "ringo",
      email: "ringo@gmail.com",
      password: "123456",
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "return a user's name as a string" do
    user = User.new(name: "ringo")
    expect(user.name).to eq "ringo"
  end
end
