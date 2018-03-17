class AddDefaultContentTypeToProjectPost < ActiveRecord::Migration[5.0]
  def change
    add_column :project_posts, :content_type, :string, default: 'ProjectPost'
  end
end
