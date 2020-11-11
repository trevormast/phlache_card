class Deck {
  constructor(cardsArray) {
    this.cardsArray = cardsArray;
  }

  chooseCard() {
    // get a random card
    let card = new Card(this.cardsArray[Math.floor(Math.random() * this.cardsArray.length)]);
    // get a random number between 0 and 100
    let randomNumber = (Math.random() * 100);
    // if the random number is between 0 and the card weight, return the card
    if (randomNumber <= card.weight) { return card; }

    // otherwise, try again
    return this.chooseCard();
  }
}