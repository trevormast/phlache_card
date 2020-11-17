const DeckShow = (props) => {
  console.log(props);

  return(
    <div key={ props.id } >
      <h1>Showing Deck "{ props.name }"</h1>
      <Deck deck={ props } />
    </div>
  )
}