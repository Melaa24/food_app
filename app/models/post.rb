class Post < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('created_at DESC') }

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  self.per_page = 4
end
