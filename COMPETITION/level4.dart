class Distance {
  final double meters;

  Distance(this.meters);

  Distance.kms(double value) : meters = value * 1000;
  Distance.meters(double value) : meters = value;
  Distance.cms(double value) : meters = value / 100;

  double get kms => meters / 1000;
  double get ms => meters;
  double get cms => meters * 100;

  Distance operator +(Distance other) => Distance(this.meters + other.meters);
}

class Shape {
  Point left_bottom;
  double width, height;
  String? background;

  Shape(this.left_bottom, this.width, this.height, {this.background});

  Point get rightTop => Point(left_bottom.x + width, left_bottom.y + height);
}

class Point {
  final double x;
  final double y;

  const Point(this.x, this.y);

  Point translate(double dx, double dy) {
    return Point(x + dx, y + dy);
  }

  void Print() {
    print('x: $x, y: $y');
  }
}

void main() {
  var p1 = Point(300, 400);
  p1.Print();

  var shape = Shape(p1, 500, 500, background: 'pink');

  print('Left bottom point:');
  shape.left_bottom.Print();

  print('Right top point:');
  shape.rightTop.Print();

  double distanceValue = (shape.rightTop.x - shape.left_bottom.x).abs() +
      (shape.rightTop.y - shape.left_bottom.y).abs();

  var d = Distance.meters(distanceValue);
  print('Distance value: ${d.kms} kms');
  print('Distance value: ${d.meters} meters');
  print('Distance value: ${d.cms} cms');
}