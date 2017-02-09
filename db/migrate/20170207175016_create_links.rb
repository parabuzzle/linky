class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :short_name, null: false
      t.string :url, null: false
      t.string :params_url
      t.integer :clicks, null: false, default: 0

      t.timestamps
    end
  end
end
