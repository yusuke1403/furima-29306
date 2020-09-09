class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase

  # パスワードは半角英数字混合であること
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers' }
  with_options presence: true do
    validates :nickname, :birthday
    # ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力
    validates :family_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
    # ユーザー本名のフリガナは全角（カタカナ）で入力
    validates :family_name_kana, :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
  end
end
