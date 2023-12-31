class Bar < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :random, -> { order('RAND()') }

 validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  #validates :category,presence:true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
   def self.search_for(content, method)
    if method == 'perfect'
      Game.where(title: content)
    elsif method == 'forward'
      Game.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Game.where('title LIKE ?', '%'+content)
    else
      Game.where('title LIKE ?', '%'+content+'%')
    end
   end
end
