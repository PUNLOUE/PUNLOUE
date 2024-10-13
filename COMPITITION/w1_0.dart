 //The Point class encapsulates the concept of a point in a 2D space with x and y coordinates.
 class Point {
  double x;
  double y;

  // Constructor
  Point(this.x, this.y);

  // Method to translate the point
  //The translate method allows moving the point by specified amounts in the x and y directions.
  void translate(double dx, double dy) {
    x += dx;
    y += dy;
  }

  // Method to display the point's position
  void display() {
    print('Point(x: $x, y: $y)');
  }
}
 
 
 
//The main function demonstrates creating points, translating them, and displaying their coordinates.
void main() {
  // Create a point at (2, 3)
  var point1 = Point(2, 3);
  point1.display(); // Output: Point(x: 2.0, y: 3.0)

  // Translate the point by (1, -1)
  point1.translate(1, -1);
  point1.display(); // Output: Point(x: 3.0, y: 2.0)

  // Create another point at (0, 0)
  var point2 = Point(0, 0);
  point2.display(); // Output: Point(x: 0.0, y: 0.0)

  // Translate the point by (5, 5)
  point2.translate(5, 5);
  point2.display(); // Output: Point(x: 5.0, y: 5.0)
}


 