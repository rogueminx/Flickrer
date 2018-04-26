class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.column :user_id, :integer
      t.column :image_id, :integer
      t.column :body, :string
    end
  end
end
