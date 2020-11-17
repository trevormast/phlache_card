class Deck extends React.Component {
  constructor(props) {
    super(props);

    console.log("PROPS!");
    console.log(props);
  }

  render() {
    return(
      <div>
        <h2>{ this.props.deck.name }</h2>
      </div>
    )
  }
}