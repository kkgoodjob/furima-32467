class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :nickname, presence: true, uniqueness: true
  validates :last_name_kanji, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kanji, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true
end
