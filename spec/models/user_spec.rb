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
  it "is invalid without a email"
  
  it "is invalid without a password"

  it "is invalid with a duplicate email address"

  it "return a user's name as a string"
end
