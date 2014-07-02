# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    sequence(:email) { |n| "sample-#{ n }@example.com" }
    password 'samplepass'
    password_confirmation 'samplepass'

    factory :confirmed_admin do
      after(:build) do |admin|
        admin.skip_confirmation!
      end
    end
  end
end
