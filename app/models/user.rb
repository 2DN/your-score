class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :scores, dependent: :destroy
  has_many :tasks, dependent: :destroy

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  with_options on: :create do
    validates_format_of :password, with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  end

  with_options on: :update do
    validates_format_of :password, with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', allow_blank: true
  end
  
  
  validates :username, presence: true

end
