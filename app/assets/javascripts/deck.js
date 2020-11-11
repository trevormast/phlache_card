class Deck {
  constructor(cardsArray) {
    this.cardsArray = cardsArray;
  }

  chooseCard() {
    return this.cardsArray[Math.floor(Math.random() * this.cardsArray.length)];
  }
}