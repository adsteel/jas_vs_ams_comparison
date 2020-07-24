FactoryBot.define do
  factory :post do
    user
    title { "MyString" }
    body { "MyText" }
  end
end
