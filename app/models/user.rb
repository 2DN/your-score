class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :scores
  has_many :tasks
  has_many :user_tag_relations
  has_many :tags, through: :user_tag_relations
end
