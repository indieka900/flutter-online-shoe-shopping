import 'package:flutter_project/views/shared/export.dart';


class CartProvider extends ChangeNotifier {
  int _counter = 0;
  final _cartBox = Hive.box('cart_box');
  List<dynamic> _cart = [];

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter >= 1) {
      _counter++;
      notifyListeners();
    }
  }

  List<dynamic> get cart => _cart;

  set cart(List<dynamic> newCart) {
    _cart = newCart;
    notifyListeners();
  }

  getCart() {
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);
      return {
        "key": key,
        "id": item['id'],
        "category": item['category'],
        "name": item['name'],
        "imageUrl": item['imageUrl'],
        "price": item['price'],
        "qty": item['qty'],
        "sizes": item['sizes']
      };
    }).toList();

    _cart = cartData.reversed.toList();
  }

  Future<void> deleteCart(int key) async {
    await _cartBox.delete(key);
  }

  Future<void> createCart(Map<dynamic, dynamic> newCart) async {
    await _cartBox.add(newCart);
  }
}
