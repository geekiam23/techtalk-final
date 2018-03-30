class AddDefaultContentTypeToTextPost < ActiveRecord::Migration[5.0]
  def change
    add_column :text_posts, :content_type, :string, default: 'TextPost'
  end
end
