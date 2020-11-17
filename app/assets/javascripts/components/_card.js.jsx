class Card extends React.Component {
  constructor(props) {
    super(props);

    this.state = { questionShowing: true }

    this.handleCardClick = () => {
      if (!this.state.questionShowing) { this.props.deckHandler() }
      this.setState({ questionShowing: !this.state.questionShowing });
    }
  }

  render() {
    let cardText = this.state.questionShowing ? this.props.card.front : this.props.card.back;

    return (
      <div id="card-holder" onClick={ this.handleCardClick } className="card d-flex flex-row justify-content-center align-items-center text-center">
        <div className="card-body">
          <div id="card-text">{ cardText }</div>
        </div>
      </div>
    )
  }

}