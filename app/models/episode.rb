class Episode < ActiveRecord::Base

  # Validate the input
  validates :feedly_id, presence: true, uniqueness: true
  validates :show, presence: true
  validates :title, presence: true
  validates :json, presence: true

end
