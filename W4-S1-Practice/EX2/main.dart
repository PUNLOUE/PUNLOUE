import 'package:flutter/material.dart';

const String f = 'assets/W4-S1/dart.png';
const String d = 'assets/W4-S1/firebase.png';
const String f1 = 'assets/W4-S1/firebase.png';


enum Product {
  Dart,
  Flutter,
  Firebase,
}


class ProductInfo {
  final String title;
  final String description;
  final String image;

  ProductInfo({
    required this.title,
    required this.description,
    required this.image,
  });
}

final Map<Product, ProductInfo> productInfoMap = {
  Product.Dart: ProductInfo(
    title: 'Dart',
    description: 'The best object language',
    image: d,
  ),
  Product.Flutter: ProductInfo(
    title: 'Flutter',
    description: 'The best mobile wildet library',
    image: f,
  ),
  Product.Firebase: ProductInfo(
    title: 'Firebase',
    description: 'The best cloud database',
    image: f1,
  ),
};
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  const Text('Products'),
        ),
        backgroundColor: Colors.blue,
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [
              ProductCard(
                product: Product.Flutter,
              ),
              SizedBox(height: 10,),
              ProductCard(
                product: Product.Dart,
              ),
              SizedBox(height: 10,),
              ProductCard(
                product: Product.Firebase,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    ProductInfo info = productInfoMap[product]!;
    return Card(
      child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Image.asset(
            info.image, 
            width: 80,
            height: 90,
          ), // Make sure to provide the correct path to the image
          Text(
            info.title,
            style: const TextStyle(fontSize: 30,),    

          ),
          Text(info.description),
        ],
      ),
      ),
    
    );
  }
}