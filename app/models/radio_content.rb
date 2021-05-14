class RadioContent < ApplicationRecord

  belongs_to :radio_info

  with_options presence: true do
    validates :time
    validates :content
  end
end
