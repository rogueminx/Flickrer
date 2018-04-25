class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.column :title, :string
      t.column :description, :string
    end
  end
end
