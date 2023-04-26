class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :email
      t.string :name
      t.text :content
      t.references :art, null: false, foreign_key: true

      t.timestamps
    end
  end
end
