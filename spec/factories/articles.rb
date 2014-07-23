# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title "MyString"
    content "MyText"
    published_at "2014-07-23 23:23:43"
    slug "MyString"
  end
end
