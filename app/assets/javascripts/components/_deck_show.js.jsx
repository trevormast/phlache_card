const DeckShow = (props) => {
  console.log(props);

  return(
    <div>
      <h1>SHOWING REACT DECK</h1>
      <div key={ props.id } >
        <Deck deck={ props } />
      </div>
    </div>
  )
}