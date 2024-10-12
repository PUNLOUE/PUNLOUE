void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];
  //const order = ['margherita', 'pepperoni'];
  // Your code

   // Calculate total
  double total = 0.0;//is a variable to keep track of the total price of the order.
  bool allOnMenu = true;//is a boolean variable to check if all ordered pizzas are on the menu.

  //checks if the current pizza is in the pizzaPrices map
  for (var pizza in order) {
    if (pizzaPrices.containsKey(pizza)) {
      total += pizzaPrices[pizza]!;
    } else {
      print('$pizza pizza is not on the menu');
      allOnMenu = false;
    }
  }
  //After the loop, if allOnMenu is still true (meaning all pizzas in the order were on the menu), the total price is printed.
  
  if (allOnMenu) {
    print('Total: \$${total.toStringAsFixed(2)}');
  }
     
}
