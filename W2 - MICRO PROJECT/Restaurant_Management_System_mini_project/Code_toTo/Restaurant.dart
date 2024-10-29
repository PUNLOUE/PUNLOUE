 //detail of menuitem
 class MenuItem {
  int itemID;
  String name;
   
  double price;

  MenuItem(this.itemID, this.name, this.price);

  void updatePrice(double newPrice) {
    price = newPrice;
  }

}

//Menu for customer
class Menu {
  int menuID;
  List<MenuItem> items = [];

  Menu(this.menuID,this.items);

  void addItem(MenuItem item) {
    items.add(item);
  }

  void removeItem(MenuItem item) {
    items.remove(item);
  }

  void updateItem(MenuItem oldItem, MenuItem newItem) {
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
  List<MenuItem> orderItems = [];
  double totalAmount = 0.0;
  OrderStatus orderStatus;
  PaymentStatus paymentStatus;

  Order(this.orderID, this.customerID, this.orderStatus, this.orderItems, this.paymentStatus, this.totalAmount);

  void addItem(MenuItem item) {
    orderItems.add(item);
    calculateTotal();
  }

  void removeItem(MenuItem item) {
    orderItems.remove(item);
    calculateTotal();
  }

  void calculateTotal() {
    totalAmount = orderItems.fold(0, (sum, item) => sum + item.price);
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
  }

  void reserveTable(TableReservation reservation) {
    // Implementation for reserving a table
  }
}
 
void main() {
  // Creating menu items
  MenuItem item1 = MenuItem(1, 'Pizza', 12.99);
  MenuItem item2 = MenuItem(2, 'Salad', 7.99);

  // Creating a menu and adding items
  Menu menu = Menu(1, []);
  menu.addItem(item1);
  menu.addItem(item2);

  // Printing menu items
  print('\n\n');
  print('<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><');
  print('                                 Menu Items                              ');
  print('<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><');
  for (var item in menu.items) {
    print('ID: ${item.itemID}, Name: ${item.name}, Price: \$${item.price}');
  }

  // Creating a customer
  Customer customer = Customer(1, 'Alice', 'alice@example.com');

  // Creating an order
  Order order = Order(1, customer.customerID, OrderStatus.pending, [], PaymentStatus.Unpaid, 0.0);
  order.addItem(item1);
  order.addItem(item2);

  // Printing order details
  print('\n\n');
  print('<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><');
  print('                                 Order Details                           ');
  print('<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><');
  
  print('Order ID: ${order.orderID}');
  print('Customer ID: ${order.customerID}');
  print('Order Status: ${order.orderStatus}');
  print('Payment Status: ${order.paymentStatus}');
  print('Total Amount: \$${order.totalAmount}');
  print('Order Items:');
  for (var item in order.orderItems) {
    print('ID: ${item.itemID}, Name: ${item.name}, Price: \$${item.price}');
  }

  // Creating a table reservation
  TableReservation reservation = TableReservation(1, customer.customerID, ['T005', 'T006'], DateTime.now(), 4);
  reservation.makeReservation();
// Checking table availability
  print('\n\n');
  print('<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><');
  print('                                 Table Availability                       ');
  print('<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><');
  reservation.checkTableAvailability();


   
}
