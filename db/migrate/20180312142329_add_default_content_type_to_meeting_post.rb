class AddDefaultContentTypeToMeetingPost < ActiveRecord::Migration[5.0]
  def change
    add_column :meeting_posts, :content_type, :string, default: 'MeetingPost'
  end
end
