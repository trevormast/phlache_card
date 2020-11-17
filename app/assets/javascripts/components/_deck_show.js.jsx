const DeckShow = (props) => {
  console.log(props);

  return(
    <div key={ props.id } className={ props.name }>
      <h1>SHOWING REACT DECK</h1>
      <Deck
        deck={ props }
      />
    </div>
  )
}