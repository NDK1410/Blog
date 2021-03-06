class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category, touch: true
  extend FriendlyId
  friendly_id :title, use: [:slugged]
  searchkick text_start: [:content]

  scope :newest_by_desc, -> { order "created_at DESC" }
  scope :newest_by_id, -> { order "posts.id DESC" }
  scope :posts_of_category, -> (category_id){ where category_id: category_id }
  scope :view_of_post, -> { order "posts.view DESC" }
 
end
