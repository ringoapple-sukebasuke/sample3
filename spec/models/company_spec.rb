require 'rails_helper'

RSpec.describe Company, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.create(:company)).to be_valid
  end

  it "is invalid without a number" do
    company = FactoryBot.build(:company, number: nil)
    company.valid?
    expect(company.errors[:number]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a name" do
    company = FactoryBot.build(:company, name: nil)
    company.valid?
    expect(company.errors[:name]).to include(I18n.t('errors.messages.blank'))
  end

  it "is invalid without a information" do
    company = FactoryBot.build(:company, information: nil)
    company.valid?
    expect(company.errors[:information]).to include(I18n.t('errors.messages.blank'))
  end

  it "return a company's name as a string" do
    company = FactoryBot.build(:company, name: "MyString")
    expect(company.name).to eq "MyString"
  end
 

end
