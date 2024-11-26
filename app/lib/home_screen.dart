 import 'package:flutter/material.dart';
import 'cart.dart';
import 'profile.dart';
import 'add_product.dart';
import 'product_details.dart';
 
 
 class Home extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
  }

  class _HomeState extends State<Home> {
    int _selectedIndex = 0;
    List<Map<String, dynamic>> products = [];
    List<Map<String, dynamic>> cart = [];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

   void _addToCart(Map<String, dynamic> product) {
    if (!cart.contains(product)) {
      setState(() {
        cart.add(product);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product['name']} added to cart!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product['name']} is already in the cart.')),
      );
    }
  }

  void _removeFromCart(Map<String, dynamic> product) {
    setState(() {
      cart.remove(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product['name']} removed from cart.')),
    );
  }
    void _editProduct(int index, Map<String, dynamic> updatedProduct) {
      setState(() {
        products[index] = updatedProduct; // Update the product
      });
    }

    void _deleteProduct(int index) {
      if (cart.elementAtOrNull(index)==null) {


       setState(() {
        products.removeAt(index); 
      });
    } else {
      setState(() {
        cart.remove(cart.elementAt(index));
        products.removeAt(index); 
      });
    }
    }

    @override
    Widget build(BuildContext context) {
      List<Widget> _pages = <Widget>[
        MainPage(products: products, addToCart: _addToCart),
        ProfilePage(
          products: products,
          onAddProduct: (product) {
            setState(() {
              products.add(product);
            });
          },
          onEditProduct: (index, updatedProduct) {
            setState(() {
              products[index] = updatedProduct; // Update the product in the list
            });
          },
          onDeleteProduct: _deleteProduct, // Pass delete function
        ),
        CartPage(cart: cart, removeFromCart: _removeFromCart),
      ];

      return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.teal,
        ),
      );
    }
  }
  class MainPage extends StatefulWidget {
    final List<Map<String, dynamic>> products;
    final Function(Map<String, dynamic>) addToCart;

    MainPage({required this.products, required this.addToCart});

    @override
    _MainPageState createState() => _MainPageState();
  }

  class _MainPageState extends State<MainPage> {
    String searchQuery = "";
    final List<Map<String, dynamic>> cart = []; // Shared cart list

    // Method to add products to the cart
    void addToCart(Map<String, dynamic> product) {
      if (!cart.contains(product)) {
      setState(() {
        cart.add(product);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product['name']} added to cart!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product['name']} is already in the cart.')),
      );
    }
    }

    // Method to remove products from the cart
    void removeFromCart(Map<String, dynamic> product) {
      setState(() {
        cart.remove(product); // Remove product from cart
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product['name']} removed from cart!')),
      );
    }

    @override
    Widget build(BuildContext context) {
      final filteredProducts = widget.products
          .where((product) =>
      product['name'] != null &&
          product['name'].toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'StoreApp',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
                              centerTitle: true,

          
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value; // Update search query
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: filteredProducts.isEmpty
            ? Center(
          child: Text(
            'No products found!',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        )
            : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            return ProductCard(
              imageUrl: filteredProducts[index]['image'],
              productName: filteredProducts[index]['name'],
              productDescription: filteredProducts[index]['description'] ?? "No description available.",
              price: '\$${filteredProducts[index]['price']}',
              onBuy: () {

                 widget.addToCart(filteredProducts[index]);              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      product: filteredProducts[index],
                    ),
                  ),
                );
              },
            );
          },

        ),
      );
    }
  }
