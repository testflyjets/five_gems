FactoryGirl.define do
  factory :event do
    name 'My Event'
    start_time Time.now
    end_time (Time.now + 2.hours)
    full_address '704 J St, San Diego, CA 92101'
  end
end
