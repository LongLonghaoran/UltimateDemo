class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.string :item_id
      t.string :group_id
      t.text :abstract
      t.integer :comments_count
      t.string :chinese_tag
      t.string :source
      t.string :source_url
      t.string :middle_image_url

      t.timestamps
    end
  end
end
