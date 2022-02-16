require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is invalid without a body" do
    comment = FactoryBot.build(:comment, body: nil)
    comment.valid?
    expect(comment.errors[:body]).to include(I18n.t('errors.messages.blank'))
  end

  it "bodyの文字数が1001文字以上の場合エラーメッセージを返す" do
    comment = FactoryBot.create(:comment)
    comment.body = Faker::Lorem.characters(number: 1001)
    comment.valid?
    expect(comment.errors[:body]).to include("は1000文字以内で入力してください")
  end
end
