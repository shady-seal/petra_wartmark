class AddSubjectToRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :subject, :string
  end
end
