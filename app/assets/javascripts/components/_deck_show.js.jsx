const DeckShow = (props) => {

  return(
    <div key={ props.id } >
      <h1 className="text-center">{ props.name }</h1>
      <br/>
      <Deck deck={ props } />
    </div>
  )
}