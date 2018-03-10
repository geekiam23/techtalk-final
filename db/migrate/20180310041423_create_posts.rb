class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :content_type
      t.integer :content_id
      t.index [:content_type, :content_id]

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
