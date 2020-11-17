class Deck extends React.Component {
  // create the deck
  constructor(props) {
    super(props);

    // get the card from the props
    this.cards = props.deck.cards;
    this.handleCardChange = this.handleCardChange.bind(this);

    // set the current card
    this.state = {
      currentCard: this.chooseCard()
    }
  }

  // choose a card, letting the 'weight' determine the likelyhood of the card being chosen
  chooseCard() {
    // get a random card
    let card = this.cards[Math.floor(Math.random() * this.cards.length)];
    // get a random number between 0 and 100
    let randomNumber = (Math.random() * 100);
    // if the random number is between 0 and the card weight, return the card
    if (randomNumber <= card.weight) { return card; }

    console.log('choosing again');
    // otherwise, try again
    return this.chooseCard();
  }

  // when the card is clicked for the second time, choose a new card
  handleCardChange() {
    // set the state
    this.setState({ currentCard: this.chooseCard() });
  }

  render() {
    return(
      <div key={ this.state.currentCard.id } id="card-practice" className="d-flex flex-column justify-content-center align-items-center">
        <Card
          card={ this.state.currentCard }
          deckHandler={ this.handleCardChange }
        />
      </div>
    )
  }
}