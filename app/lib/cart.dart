 import 'package:flutter/material.dart';
  import 'dart:io';

  class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cart;
  final Function(Map<String, dynamic>) removeFromCart;

  const CartPage({required this.cart, required this.removeFromCart, Key? key})
      : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // حساب السعر الإجمالي
  double _calculateTotal() {
    return widget.cart.fold(0, (sum, product) {
      final double price = double.tryParse(product['price'].toString()) ?? 0.0;
      final int quantity = product['quantity'] ?? 1; // الكمية الافتراضية هي 1
      return sum + (price * quantity);
    });
  }

  // تحديث الكمية عند تغيّرها
  void _updateQuantity(Map<String, dynamic> product, int newQuantity) {
    setState(() {
      product['quantity'] = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
                            centerTitle: true,

      ),
      body: widget.cart.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: widget.cart.length,
              itemBuilder: (context, index) {
                final product = widget.cart[index];
                return CartItem(
                  product: product,
                  onRemove: () {
                    setState(() {
                      widget.removeFromCart(product);
                    });
                  },
                  onQuantityChanged: (newQuantity) {
                    _updateQuantity(product, newQuantity);
                  },
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // السعر الإجمالي
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${_calculateTotal().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            // زر Check Out
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Checkout is not implemented yet!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Check Out',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  final Map<String, dynamic> product;
  final VoidCallback onRemove;
  final Function(int) onQuantityChanged;

  const CartItem({
    required this.product,
    required this.onRemove,
    required this.onQuantityChanged,
    Key? key,
  }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int _quantity; // الكمية المحلية للمنتج

  @override
  void initState() {
    super.initState();
    _quantity = widget.product['quantity'] ?? 1; // الكمية الافتراضية هي 1
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
    widget.onQuantityChanged(_quantity); // تحديث الكمية في المنتج
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
      widget.onQuantityChanged(_quantity); // تحديث الكمية في المنتج
    }
  }

  @override
  Widget build(BuildContext context) {
    final double price = double.tryParse(widget.product['price'].toString()) ?? 0.0;
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: _getImageProvider(widget.product['image']),
        ),
        title: Text(widget.product['name'] ?? 'No Name'),
        subtitle: Text(
          '\$${(price * _quantity).toStringAsFixed(2)}',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove, color: Colors.red),
              onPressed: _decrementQuantity,
            ),
            Text(
              _quantity.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(Icons.add, color: Colors.green),
              onPressed: _incrementQuantity,
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: widget.onRemove,
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider _getImageProvider(dynamic image) {
    if (image is File) {
      return FileImage(image);
    } else if (image is String) {
      return FileImage(File(image));
    } else {
      return AssetImage('assets/placeholder.png');
    }
  }
}