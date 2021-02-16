FactoryBot.define do
  factory :task do
    task_title { '予備校模試' }
    memo { '会場は仙台駅裏の予備校。受付は午前9時からスタート。持ち物は筆記用具と昼食。' }
    limit_date { '2021-04-24' }
    association :user
  end
end
