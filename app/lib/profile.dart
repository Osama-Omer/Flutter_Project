 import 'package:app/main.dart';
import 'package:app/screen/sign_up.dart';
import 'package:flutter/material.dart';
 import 'add_product.dart';
 import 'editProduct.dart';

 
 
 class ProfilePage extends StatelessWidget {

    final List<Map<String, dynamic>> products;
    final Function(Map<String, dynamic>) onAddProduct;
    final Function(int, Map<String, dynamic>) onEditProduct;
    final Function(int) onDeleteProduct;

    ProfilePage({
      required this.products,
      required this.onAddProduct,
      required this.onEditProduct,
      required this.onDeleteProduct,
    });

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
                    centerTitle: true,

        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircleAvatar(backgroundImage: AssetImage("images/logo.png"),child: Text("",style: TextStyle(color: const Color.fromARGB(255, 245, 241, 231),fontSize:  60),),
                  backgroundColor: Colors.red,
                ),
                
              ],
            ),
          ),
            SizedBox(height: 10),
            Text(
              UserName!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length + 1,
                itemBuilder: (context, index) {
                  if (index == products.length) {
                    return Container(
                      width: 200, // Set desired width
                      height: 50, // Set desired height
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Add margin
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15), // Set border radius
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddProductPage(
                                onAddProduct: onAddProduct,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Add Product',
                          style: TextStyle(color: Colors.white, fontSize: 18), // Change text color to white
                        ),
                      ),
                    );
                  }
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Add margin
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // Set border radius
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.grey.withOpacity(.1),
                          spreadRadius: 1,
                          offset: Offset(10, 10),
                        ),
                      ],
                    ),
                    child: Card(
                      color: const Color.fromARGB(255, 206, 177, 183),
                      margin: EdgeInsets.all(0), // No margin needed here, handled by the outer container
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Set border radius for the card
                      ),
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(products[index]['image']),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        title: Text(
                          products[index]['name'],
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '\$${products[index]['price']}',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProductPage(
                                      product: products[index],
                                      onUpdateProduct: (updatedProduct) {
                                        onEditProduct(index, updatedProduct);
                                        Navigator.pop(context); // Go back after editing
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                onDeleteProduct(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
