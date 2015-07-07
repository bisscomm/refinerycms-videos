
FactoryGirl.define do
  factory :video, :class => Refinery::Videos::Video do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

