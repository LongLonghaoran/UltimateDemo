class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :size
      t.string :path
      t.string :file

      t.timestamps null: false
    end
  end
end
