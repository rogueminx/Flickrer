class AddImageAttachmentToImages < ActiveRecord::Migration[5.2]
  def up
    add_attachment :images, :image
  end

  def down
    remove_attachment :images, :image
  end
end
