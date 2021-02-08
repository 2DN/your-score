class Score < ApplicationRecord
  belongs_to :user
  has_many :averages, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :score_tag_relations, dependent: :destroy
  has_many :tags, through: :score_tag_relations
end
