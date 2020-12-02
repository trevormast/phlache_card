require 'csv'

class Card < ApplicationRecord
  belongs_to :deck

  before_update :set_default_weight, if: :card_content_changed?

  validates_presence_of :front, :back

  # generate csv for provided cards
  def self.generate_csv(cards)
    # only include these attributea
    attributes = %w{front back}

    # create the csv
    CSV.generate(headers: true) do |csv|
      # add the headers from the attributes
      csv << attributes

      # for each card, add the attribute values
      cards.find_each do |card|
        csv << attributes.map{ |attr| card.send(attr) }
      end
    end
  end

  def self.display_cards(cards)
    cards_attributes = cards.map do |card|
      card.attributes_for_display.join("\n").prepend('#')
    end

    return cards_attributes.join("\n\n")
  end

  def attributes_for_display
    return [front, back]
  end
  # def weight=(value)
  #   # dont let the value be less than 0
  #   value = [0, value].max
  #   super(value)
  # end

  private
    # card content has changed if the front or back have changed
    def card_content_changed?
      (%w(front back) & changes_to_save.keys).present?
    end

    def set_default_weight
      # set the weight to the default
      self.weight = Card.column_defaults["weight"]
    end
end
