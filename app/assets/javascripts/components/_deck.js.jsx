class Deck extends React.Component {
  constructor(props) {
    super(props);

    this.cards = props.deck.cards;

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

  render() {
    return(
      <div>
        <h2>{ this.props.deck.name }</h2>
        <br/><br/>
        <h3>{ this.state.card.front }</h3>
        <h3>{ this.state.card.back }</h3>
      </div>
    )
  }
}