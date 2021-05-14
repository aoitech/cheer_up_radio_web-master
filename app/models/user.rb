class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 1, member: 2 }

  has_many :radio_infos

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :role
  end

  validates :email, format: { with: /\A[a-z]{2,10}\.[a-z]{2,10}+@di-v.co.jp\z/, message: 'はdivのメールアドレスで登録してね★☆' }
end
