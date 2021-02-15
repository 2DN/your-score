class Task < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :task_title
    validates :limit_date
  end
end
