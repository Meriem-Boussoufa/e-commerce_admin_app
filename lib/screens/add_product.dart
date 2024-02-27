import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin_app/db/brand.dart';
import 'package:e_commerce_admin_app/db/category.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Color white = Colors.white;
  Color black = Colors.black;
  MaterialColor grey = Colors.grey;
  MaterialColor red = Colors.red;

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController productName = TextEditingController();

  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];

  CategoryService categoryService = CategoryService();
  BrandService brandService = BrandService();

  late Future<List<DocumentSnapshot>> _categoriesFuture;
  late Future<List<DocumentSnapshot>> _brandsFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = categoryService.getCategories();
    _brandsFuture = brandService.getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: black,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Add Product',
          style: TextStyle(color: black),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: grey.withOpacity(0.5), width: 2.5)),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(14, 40, 14, 40),
                          child: Icon(Icons.add, color: grey),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: grey.withOpacity(0.5), width: 2.5)),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(14, 40, 14, 40),
                          child: Icon(Icons.add, color: grey),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: grey.withOpacity(0.5), width: 2.5)),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(14, 40, 14, 40),
                          child: Icon(Icons.add, color: grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Enter a product name with 10 characters maximum',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: productName,
                  decoration: const InputDecoration(
                    hintText: 'Product Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'You must enter the product name';
                    } else if (value.length > 10) {
                      return 'Product name cant have more than 10 letters';
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Category',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<List<DocumentSnapshot>>(
                  future: _categoriesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<DocumentSnapshot>? categories = snapshot.data;
                      return Column(
                        children: [
                          DropdownButtonFormField<String>(
                            value: null,
                            hint: const Text('Select a category'),
                            items: categories!.map((category) {
                              return DropdownMenuItem<String>(
                                value: category['categoryName'] as String,
                                child: Text(category['categoryName'] as String),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                          // Your other UI widgets
                        ],
                      );
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Brand',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<List<DocumentSnapshot>>(
                  future: _brandsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<DocumentSnapshot>? brands = snapshot.data;
                      return Column(
                        children: [
                          DropdownButtonFormField<String>(
                            value: null,
                            hint: const Text('Select a brand'),
                            items: brands!.map((brand) {
                              return DropdownMenuItem<String>(
                                value: brand['brandName'] as String,
                                child: Text(brand['brandName'] as String),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                          // Your other UI widgets
                        ],
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Quantity',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'You must enter the product name';
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Available Sizes',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              const Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('XS'),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('S'),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('M'),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('L'),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('XL'),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('XXL'),
                ],
              ),
              const Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('28'),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('30'),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('32'),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('34'),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('36'),
                  Checkbox(
                    value: false,
                    onChanged: null,
                  ),
                  Text('38'),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Add Product',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
