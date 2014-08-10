FactoryGirl.define do
  factory :category do
    name 'sample name'
    sequence(:slug) { |n| "sample-slug-#{ n }" }
  end
end
