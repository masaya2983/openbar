class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :liquor
  validates_uniqueness_of :liquor_id, scope: :user_id
end
