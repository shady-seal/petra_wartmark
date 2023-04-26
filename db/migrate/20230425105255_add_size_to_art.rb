class AddSizeToArt < ActiveRecord::Migration[7.0]
  def change
    add_column :arts, :size, :string
  end
end
