class Task < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :task_title
    validates :limit_date
  end

  validates :task_title, length: { maximum: 20 }
  validates :memo, length: { maximum: 100 }, allow_blank: true
end
