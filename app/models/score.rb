class Score < ApplicationRecord
  belongs_to :user
  belongs_to :average
  belongs_to :subject
  has_many :score_tag_relations
  has_many :tags, through: :score_tag_relations
end
