# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image_attachment do
    attachable_type "MyString"
    attachable_id 1
    position 1
  end
end
