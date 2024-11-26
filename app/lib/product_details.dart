import 'package:flutter/material.dart';





class ProductDetailsPage extends StatelessWidget {
    final Map<String, dynamic> product;

    ProductDetailsPage({required this.product});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(product['name'],style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),

          ),
        ),
        body:

        Padding(


          padding: const EdgeInsets.all(16.0),
          child: Container(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(product['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Text('Name :' ,style: TextStyle(fontSize: 22),),
                    Text(
                      product['name'],
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Text('Price :' ,style: TextStyle(fontSize: 22),),
                    Text(
                      '\$${product['price']}',
                      style: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Description : ' ,style: TextStyle(fontSize: 20),),
                    Text(
                      product['description'],
                      style: TextStyle(fontSize: 29),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }