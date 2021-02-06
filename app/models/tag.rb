class Tag < ApplicationRecord
  has_many :score_tag_relations
  has_many :scores, through: :score_tag_relations
  has_many :user_tag_relations
  has_many :users, through: :user_tag_relations

  validates :tag_name, uniqueness: true
end
