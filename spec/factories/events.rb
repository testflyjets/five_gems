FactoryGirl.define do
  factory :event do
    name 'My Event'
    start_time Time.now
    end_time (Time.now + 2.hours)
  end
end
