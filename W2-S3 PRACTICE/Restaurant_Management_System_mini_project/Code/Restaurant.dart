 //detail of menuitem
 class Item {
  int itemID;
  String name;
  double price;
  Item(this.itemID, this.name, this.price);

  void updatePrice(double newPrice) {
    price = newPrice;
  }
}

//Menu for customer
class Menu {
  int menuID;
  List<Item> items = [];

  Menu(this.menuID,this.items);

  void addItem(Item item) {
    items.add(item);
  }

  void removeItem(Item item) {
    items.remove(item);
  }

  void updateItem(Item oldItem, Item newItem) {
    int index = items.indexOf(oldItem);
    if (index != -1) {
      items[index] = newItem;
    }
  }
}

enum OrderStatus {
  pending,
  completed,
  InProgress,
  Cancelled
  
}

enum PaymentStatus {
  Unpaid,
  Paid,
  Refunded
}


class Order {
  int orderID;
  int customerID;
  List<Item> orderItems = [];
  double totalAmount = 0.0;
  OrderStatus orderStatus;
  PaymentStatus paymentStatus;

  Order(this.orderID, this.customerID, this.orderStatus, this.orderItems, this.paymentStatus, this.totalAmount);

  void addItem(Item item) {
    orderItems.add(item);
    calculateTotal();
  }

  void removeItem(Item item) {
    orderItems.remove(item);
    calculateTotal();
  }

  void calculateTotal() {
    totalAmount = orderItems.fold(0, (sum, item) => sum + item.price);
  }

   String getStatusAsString(OrderStatus status) {
    return status.toString().split('.').last;
  }

  String getPaymentStatusAsString(PaymentStatus status) {
    return status.toString().split('.').last;
  }
}
 
 
  class TableReservation {
  int reservationID;
  int customerID;
  List<String> tableNumbers = ['T001', 'T002', 'T003', 'T004', 'T005', 'T006', 'T007', 'T008', 'T009', 'T010'];
  List<String> reservedTables;
  DateTime reservationTime;
  int numberOfGuests;

  TableReservation(this.reservationID, this.customerID, this.reservedTables, this.reservationTime, this.numberOfGuests);

  void makeReservation() {
    bool allTablesAvailable = reservedTables.every((table) => tableNumbers.contains(table));
    
    if (allTablesAvailable) {
      reservedTables.forEach((table) => tableNumbers.remove(table));
      print('Reservation made for tables ${reservedTables.join(", ")} at $reservationTime for $numberOfGuests guests.');
    } else {
      print('One or more tables in ${reservedTables.join(", ")} are not available.');
    }
  }
//check table abailability
  void checkTableAvailability() {
    for (var tableNumber in tableNumbers) {
      print('$tableNumber');
    }
  }
//cancelReservation
  void cancelReservation() {
    reservedTables.forEach((table) => tableNumbers.add(table));
  }

  void updateReservation(DateTime newTime, int newNumberOfGuests) {
    reservationTime = newTime;
    numberOfGuests = newNumberOfGuests;
  }
}

// customer
 class Customer {
  int customerID;
  String name;
  String contactDetails;

  Customer(this.customerID, this.name, this.contactDetails);

  void placeOrder(Order order) {
       // Implementation for placing an order
    order.customerID = this.customerID; // Assigning the customer ID to the order
  }

  void reserveTable(TableReservation reservation) {
    reservation.customerID = this.customerID; // Assigning the customer ID to the reservation
    reservation.makeReservation();
  }
}
 
 void main() {
  // Creating a customer
  Customer customer = Customer(1, 'Phinnaroth', 'naroth@gmail.com');

  // Creating menu items
  Item item1 = Item(1, 'pizza', 15.99);
  Item item2 = Item(2, 'Salad', 8.49);

  // Creating a menu
  Menu menu = Menu(1, [item1, item2]);

   // Print out the menu items
    menu.items.forEach((item) => print('Item ID: ${item.itemID}\nName: ${item.name}\nPrice: \$${item.price}\n---'));

 // Creating an order in a shorter way
  Order order = Order(1, customer.customerID, OrderStatus.pending, [], PaymentStatus.Unpaid, 0.0);

  // Adding items to the order
  order.addItem(item1);
  order.addItem(item2);

  // Placing the order using the customer
  customer.placeOrder(order);

  // Printing the order details
  print('Order placed by ${customer.name}:');
  print('Order ID: ${order.orderID}');
  print('Order Status: ${order.getStatusAsString(order.orderStatus)}');
  print('Total Amount: \$${order.totalAmount}');

  // Creating a table reservation
  TableReservation reservation = TableReservation(1, customer.customerID, ['T001', 'T002'], DateTime(2024, 10, 30, 18, 30), 4);

  // Reserving a table using the customer
  customer.reserveTable(reservation);
}