class Score < ApplicationRecord
  belongs_to :user
  belongs_to :average
  belongs_to :subject
end
