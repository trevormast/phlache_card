class Deck extends React.Component {
  constructor(props) {
    super(props);

    this.cards = props.deck.cards;
    this.handleCardClick = this.handleCardClick.bind(this);

    this.state = {
      card: this.chooseCard()
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
    this.setState({ card: this.chooseCard() });
  }

  render() {
    return(
      <div id="card-practice" className="d-flex flex-column justify-content-center align-items-center">
        <Card
          card={ this.state.card }
          deckHandler={ this.handleCardClick }
        />
      </div>
    )
  }
}