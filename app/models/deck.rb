class Deck < ApplicationRecord
  # DEFAULT SCOPE
  # CONSTANTS
  # VIRTUAL ATTRIBUTES
  attr_accessor :cards_text
  # ASSOCIATIONS
  belongs_to :user
  has_many :cards
  # VALIDATIONS
  validates :name, uniqueness: true, presence: true
  # CALLBACKS
  after_save { build_cards }

  private
    def build_cards
      return false if cards_text.blank?

      CardBuilder.new(self, cards_text).build
    end
end
