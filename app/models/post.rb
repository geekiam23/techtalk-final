class Post < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  belongs_to :content, polymorphic: true

  delegate :username, to: :user
end
