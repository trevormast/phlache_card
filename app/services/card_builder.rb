# build cards from a text field value
class CardBuilder
  def initialize(deck, cards_text)
    @deck = deck
    @cards_text = cards_text.strip
    @existing_cards = deck.cards.to_a
    @processed_cards = []
  end

  def build
    # build an array of card attribute hashes [{front: ..., back: ...}, ...]
    card_attribute_hashes = build_attribute_hashes

    # for each hash of card attributes
    card_attribute_hashes.each_with_index do |card_attribute_hash, index|
      # get the card at this index or a new card
      card_to_save = @existing_cards[index] || Card.new(deck: @deck)
      # assign the attributes
      card_to_save.assign_attributes(card_attribute_hash)
      # add the card to processed cards if it is saved
      @processed_cards << card_to_save if card_to_save.save
    end
  end

  private
    # build an array of card attribute hashes [{front: ..., back: ...}, ...]
    def build_attribute_hashes
      # split into array of text for each card
      cards_array = @cards_text.split("#").reject(&:blank?)
      # maps hashes representing card attributes (front & back)
      cards_attributes = cards_array.map do |card_text|
        # split the card text by \n, resulting in an array with two strings
        card_array = card_text.strip.split("\n").map(&:strip)
        # match the attribute keys to the corresponding values
        Hash[%w(front back).zip(card_array)]
      end
    end
end

#########################################
######### CARD TEXT EXAMPLE  ############
#########################################

=begin
  CARDS TEXT

  # WWII
  1939-1945

  # Marshall Plan
  1948

  # CIA coup in Iran
  1953

  ...

  CARDS ARRAY

  ["WWII\n1939", "Marshall Plan\n1948", "CIA coup in Iran\n1953"]

  [['WWII', '1939'], ['Marshall Plan', '1948'], ['CIA coup in Iran', '1953']]
=end


