import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
  });
}


class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Sports Shoes',
      description: 'ASIAN Men\'s Wonder-13 Sports Running Shoes',
      price: 539.0,
      imageUrl: 'images/s1.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Sparx Men\'s Shoes',
      description: 'Sparx Men\'s Running Shoes',
      price: 966.0,
      imageUrl: 'images/s2.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Crysta Running Shoes',
      description: 'Campus Men\'s Crysta Running Shoes',
      price: 745.0,
      imageUrl: 'images/s3.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Sparx Men\'s Shoes',
      description: 'Sparx Men\'s Running Shoes',
      price: 1390.0,
      imageUrl: 'images/s4.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Sports Shoes',
      description: 'Sparx Men Sports Shoes',
      price: 1049.0,
      imageUrl: 'images/s5.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Royce-2 Running Shoes',
      description: 'Campus Men\'s Royce-2 Running Shoes',
      price: 1043.0,
      imageUrl: 'images/s6.jpg',
    ),
    Product(
      id: 'p7',
      title: 'Asian Boy\'s Shoes',
      description: 'Asian Boys\' Walking Shoes',
      price: 599.0,
      imageUrl: 'images/s7.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Mikaasa Military Shoes',
      description: 'Mikaasa Military Joggers Running Leather Shoes for',
      price: 949.0,
      imageUrl: 'images/s8.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    notifyListeners();
  }
}
