# {"cards"=>[<ActionController::Parameters {"id"=>"1", "front"=>"CIA coup in Iran", "back"=>"1953"} permitted: true>, <ActionController::Parameters {"id"=>"2", "front"=>"Bacon's Rebellion", "back"=>"1676"} permitted: true>, <ActionController::Parameters {"id"=>"3", "front"=>"Civil War", "back"=>"1861 - 1865"} permitted: true>]} permitted: true>


class DeckCardSynchronizer
  def initialize(deck, cards_array)
    @deck = deck
    @cards_array = cards_array
  end

  def perform
    # update existing cards
    update_existing_cards
    # create new cards

    return true
  end

  private
    def update_existing_cards
      existing_cards.each do |existing_card|
        # get the card options for this card
        card_options = @cards_array.find{ |card_param| card_param['id'] == existing_card.id.to_s }.to_unsafe_h

        # don't pass in the id
        card_options.delete('id')

        # update the existing card with the card options
        existing_card.update(card_options)
      end
    end

    # get card objects from the ids in the card params
    def existing_cards
      card_ids = @cards_array.map{ |card_param| card_param['id'] }

      return Card.where(id: card_ids)
    end
end