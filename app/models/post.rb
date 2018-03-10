class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  belongs_to :user
  validates :user, presence: true
  belongs_to :content, polymorphic: true

  delegate :username, to: :user
end
