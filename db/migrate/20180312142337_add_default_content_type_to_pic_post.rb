class AddDefaultContentTypeToPicPost < ActiveRecord::Migration[5.0]
  def change
    add_column :pic_posts, :content_type, :string, default: 'PicPost'
  end
end
