import 'dart:io'; // Needed for File handling
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProductPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final Function(Map<String, dynamic>) onUpdateProduct;

  EditProductPage({
    required this.product,
    required this.onUpdateProduct,
  });

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
  File? imageFile; // Store the selected image as a File

  @override
  void initState() {
    super.initState();
    // Initialize controllers with product values
    nameController = TextEditingController(text: widget.product['name']);
    priceController = TextEditingController(text: widget.product['price'].toString());
    descriptionController = TextEditingController(text: widget.product['description']);
    imageFile = widget.product['image'] is File
        ? widget.product['image']
        : File(widget.product['image']); // Ensure it's a File
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path); // Store the image as a File
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3, // Allow multiple lines for description
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: imageFile != null
                    ? Image.file(
                  imageFile!, // Display the selected image
                  fit: BoxFit.cover,
                )
                    : Center(child: Text('Tap to select an image')),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Update Product'),
              onPressed: () {
                // Create a new product map with updated values
                Map<String, dynamic> updatedProduct = {
                  'name': nameController.text,
                  'price': double.tryParse(priceController.text) ?? 0.0,
                  'description': descriptionController.text,
                  'image': imageFile, // Pass the File object
                };

                // Call the update function
                widget.onUpdateProduct(updatedProduct);

                // Only pop if the navigator has a valid stack
                if (Navigator.canPop(context)) {
                  Navigator.pop(context); // Go back after updating
                } else {
                  // Handle case where there's no navigation stack
                  print("No navigation stack to pop.");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}














