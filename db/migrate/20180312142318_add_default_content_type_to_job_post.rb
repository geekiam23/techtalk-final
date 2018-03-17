class AddDefaultContentTypeToJobPost < ActiveRecord::Migration[5.0]
  def change
    add_column :job_posts, :content_type, :string, default: 'JobPost'
  end
end
