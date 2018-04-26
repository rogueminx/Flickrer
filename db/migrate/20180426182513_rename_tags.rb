class RenameTags < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_tags
    create_table :tags do |t|
      t.integer :user_id
      t.integer :image_id

      t.timestamps
    end
  end
end
