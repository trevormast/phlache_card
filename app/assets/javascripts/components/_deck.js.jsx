class Deck extends React.Component {
  // create the deck
  constructor(props) {
    super(props);

    this.cards = props.deck.cards;
    this.handleCardClick = this.handleCardClick.bind(this);

    // set the current card
    this.state = {
      currentCard: this.chooseCard()
    }
  }

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

  handleCardClick() {
    // set the state
    this.setState({ currentCard: this.chooseCard() });
  }

  render() {
    return(
      <div key={ this.state.currentCard.id } id="card-practice" className="d-flex flex-column justify-content-center align-items-center">
        <Card
          card={ this.state.currentCard }
          deckHandler={ this.handleCardClick }
        />
      </div>
    )
  }
}