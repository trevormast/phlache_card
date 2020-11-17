class Card extends React.Component {
  // create the card
  constructor(props) {
    super(props);

    // the question will be showing when the card is first created
    this.state = { questionShowing: true }
    this.handleCardClick = this.handleCardClick.bind(this);

  }

  // when the card is clicked
  handleCardClick() {
    // execute the deckhandler if the question is not showing (i.e., the answer is showing)
    if (!this.state.questionShowing) { this.props.deckHandler() }
    // toggle the question showing state
    this.setState({ questionShowing: !this.state.questionShowing });
  }

  render() {
    // determine the card text based on whether the question should be showing or not
    let cardText = this.state.questionShowing ? this.props.card.front : this.props.card.back;

    return (
      <div id="card-holder" onClick={ this.handleCardClick } className="card d-flex flex-row justify-content-center align-items-center text-center">
        <div className="card-body">
          <div id="card-text" className="font-weight-bold">{ cardText }</div>
        </div>
      </div>
    )
  }

}