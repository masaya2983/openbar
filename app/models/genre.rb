class Genre < ApplicationRecord
  has_many :liquors, dependent: :destroy
end
