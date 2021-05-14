class RadioInfo < ApplicationRecord

  belongs_to :user
  has_many :radio_contents, dependent: :destroy
  accepts_nested_attributes_for :radio_contents, allow_destroy: true
  has_one_attached :video

  with_options presence: true do
    validates :guest
    validates :info, format: {with: /\A[0-9]+\z/, message: 'は半角数字で入力してね☆'}
    validates :time_info, format: {with: /\A[0-9]+\z/, message: 'は半角数字で入力してね★'}
  end
end
