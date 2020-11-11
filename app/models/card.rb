class Card < ApplicationRecord
  belongs_to :deck

  validates_presence_of :front, :back

  # def weight=(value)
  #   # dont let the value be less than 0
  #   value = [0, value].max
  #   super(value)
  # end
end
