class CoffeeManager {
  final List coffeeType = [
    ["All", false],
    ["Cappucino Lattee", false],
    ["Espresso", false],
    ["Moccacino", false],
    ["Non coffee", false],
    ["Chocolate", false],
    ["Americano", false],
    ["Mocha", false],
  ];

  // function to change colors
  void coffeSelection(int index) {
    for (int i = 0; i < coffeeType.length; i++) {
      coffeeType[i][1] = false;
    }
    coffeeType[index][1] = true;
  }
}
