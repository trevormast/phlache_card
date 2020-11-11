class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards

  validates :name, uniqueness: true, presence: true
end
