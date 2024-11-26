import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';







class ProductCard extends StatelessWidget {
    final dynamic imageUrl; // Accepts both File and String
    final String productName;
    final String productDescription;
    final String price;
    final VoidCallback onBuy;
    final VoidCallback? onTap; // Optional callback for card tap

    const ProductCard({
      required this.imageUrl,
      required this.productName,
      required this.productDescription,
      required this.price,
      required this.onBuy,
      this.onTap,
    });

    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap: onTap, // Trigger navigation or any action on tap
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product Image
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: imageUrl is File
                          ? FileImage(imageUrl)
                          : AssetImage('assets/placeholder.png') as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                // Product Details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      productDescription,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey[700],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Spacer(),
                // Price and Buy Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onBuy,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        textStyle: TextStyle(color: Colors.white), // Ensures text color is white
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text("Buy", style: TextStyle(color: Colors.white)), // Ensures text color is white
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



 
  class AddProductPage extends StatefulWidget {
    final Function(Map<String, dynamic>) onAddProduct;

    AddProductPage({required this.onAddProduct});

    @override
    _AddProductPageState createState() => _AddProductPageState();
  }

  class _AddProductPageState extends State<AddProductPage> {
    final _formKey = GlobalKey<FormState>();
    final _productNameController = TextEditingController();
    final _productPriceController = TextEditingController();
    final _productDescriptionController = TextEditingController();
    final ImagePicker _picker = ImagePicker();
    XFile? _productImage;

    Future<void> _pickImage() async {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _productImage = pickedFile;
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add Product'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _productNameController,
                  decoration: InputDecoration(labelText: 'Product Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _productPriceController,
                  decoration: InputDecoration(labelText: 'Product Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product price';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _productDescriptionController,
                  decoration: InputDecoration(labelText: 'Product Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _productImage != null
                    ? Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(_productImage!.path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    : Container(
                  height: 150,
                  color: Colors.grey[200],
                  child: Icon(Icons.image, size: 50, color: Colors.grey),
                ),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick Image'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _productImage != null) {
                      widget.onAddProduct({
                        'name': _productNameController.text,
                        'price': _productPriceController.text,
                        'description': _productDescriptionController.text,
                        'image': File(_productImage!.path),
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Add Product'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
