class MeetingPost < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
