class CreateRadioInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :radio_infos do |t|
      t.string :guest,           null: false, default: ""
      t.string :info,            null: false, default: ""
      t.string :time_info,       null: false, default: ""
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
