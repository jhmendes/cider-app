class Cider < ApplicationRecord
  validates :company, presence: true
  validates :style, presence: true
  validates :abv, presence: true
  validates :season, presence: true
  validates :description, presence: true, length: { minimum: 50 }
end
