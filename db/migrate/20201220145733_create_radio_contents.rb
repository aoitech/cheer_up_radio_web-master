class CreateRadioContents < ActiveRecord::Migration[6.0]
  def change
    create_table :radio_contents do |t|
      t.string :time,              null: false, default: ""
      t.string :content,           null: false, default: ""
      t.references :radio_info,    foreign_key: true
      t.timestamps
    end
  end
end
