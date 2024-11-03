 class Item {
  int itemID;
  String name;
  double price;
  
  Item(this.itemID, this.name, this.price);

  void updatePrice(double newPrice) {
    price = newPrice;
  }
}

class Menu {
  int menuID;
  List<Item> items = [];

  Menu(this.menuID, this.items);

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

class Customer {
  int customerID;
  String name;
  String contactDetails;

  Customer(this.customerID, this.name, this.contactDetails);

  void placeOrder(Order order) {
    order.customerID = this.customerID;
  }
}

class ReservationManager {
  List<SingleTableReservation> reservations = [];

  List<String> tableNumbers = ['T001', 'T002', 'T003', 'T004', 'T005', 'T006', 'T007', 'T008', 'T009', 'T010'];

  void addReservation(SingleTableReservation reservation) {
    reservations.add(reservation);
  }

  void removeReservation(SingleTableReservation reservation) {
    reservations.remove(reservation);
  }

  void updateReservation(SingleTableReservation oldReservation, SingleTableReservation newReservation) {
    int index = reservations.indexOf(oldReservation);
    if (index != -1) {
      reservations[index] = newReservation;
    }
  }
}

class SingleTableReservation {
  int reservationID;
  int customerID;
  String tableNumber;
  DateTime reservationTime;
  int numberOfGuests;

  SingleTableReservation(this.reservationID, this.customerID, this.tableNumber, this.reservationTime, this.numberOfGuests);

  void makeReservation() {
    print('Reservation made for table $tableNumber at $reservationTime for $numberOfGuests guests.');
  }

  void cancelReservation() {
    print('Reservation for table $tableNumber cancelled.');
  }

  void updateReservation(DateTime newTime, int newNumberOfGuests) {
    reservationTime = newTime;
    numberOfGuests = newNumberOfGuests;
    print('Reservation for table $tableNumber updated to $newTime for $newNumberOfGuests guests.');
  }
}

void main() {
  Customer customer = Customer(1, 'Phinnaroth', 'naroth@gmail.com');

  Item item1 = Item(1, 'Pizza', 15.99);
  Item item2 = Item(2, 'Salad', 8.49);

  Menu menu = Menu(1, [item1, item2]);

  menu.items.forEach((item) => print('Item ID: ${item.itemID}\nName: ${item.name}\nPrice: \$${item.price}\n---'));

  Order order = Order(1, customer.customerID, OrderStatus.pending, [], PaymentStatus.Unpaid, 0.0);
  order.addItem(item1);
  order.addItem(item2);

  customer.placeOrder(order);

  print('Order placed by ${customer.name}:');
  print('Order ID: ${order.orderID}');
  print('Order Status: ${order.getStatusAsString(order.orderStatus)}');
  print('Total Amount: \$${order.totalAmount}');

  ReservationManager reservationManager = ReservationManager();
  SingleTableReservation reservation = SingleTableReservation(1, customer.customerID, 'T001', DateTime(2024, 10, 30, 18, 30), 4);

  reservationManager.addReservation(reservation);
  reservation.makeReservation();
  reservation.cancelReservation();
  reservation.updateReservation(DateTime(2024, 10, 30, 19, 30), 6);
}
