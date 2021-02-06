class ScoreTagRelation < ApplicationRecord
  belongs_to :score
  belongs_to :tag
end
