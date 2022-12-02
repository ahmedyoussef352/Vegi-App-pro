// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:uuyuyuy/providers/product_providers.dart';
import 'package:uuyuyuy/sreens/Widget/custom_Text_field.dart';
import 'package:uuyuyuy/sreens/models/productmodel.dart';

import '../../Widget/app_scaffold.dart';
import '../admin_panel/admin_home.dart';

class AddProductAdmin extends StatefulWidget {
  String collection;
  AddProductAdmin({super.key, 
    required this.collection,
  });

  @override
  State<AddProductAdmin> createState() => _AddProductAdminState();
}

class _AddProductAdminState extends State<AddProductAdmin> {
  late ProductModel product;
  @override
  Widget build(BuildContext context) {
    // ProductModel product;
    ProductProvider productProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 237, 204, 71),
        title: Text(
          'Add Product',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 48,
          child: productProvider.isloadding == false
              ? MaterialButton(
                  onPressed: () {
                    productProvider.addProduct(context,widget.collection,ProductModel);  //   Navigator.of(context)
                  //     .pushReplacement(MaterialPageRoute(builder: (context) {
                  //   return AppScaffold(child: AdminPanelHome());
                  // }));
                  },
                  child: Text(
                    'Add Product',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  color: Color.fromARGB(255, 237, 204, 71),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(children: [
          CostomTextField(
            labText: "Product id",
            controller: productProvider.productIde,
            keyboardType: TextInputType.number,
          ),
          CostomTextField(
            labText: "Product Name",
            controller: productProvider.productName,
          ),
          CostomTextField(
            labText: "Product Price",
            controller: productProvider.productPrice,
            keyboardType: TextInputType.number,
          ),
          CostomTextField(
            labText: "Product Quantity",
            controller: productProvider.productQuantity,
            keyboardType: TextInputType.number,
          ),
          CostomTextField(
            labText: "Product Image",
            controller: productProvider.productImage,
          ),
          // CostomTextField(
          //   labText: "Product Unit",
          //   controller: productProvider.productUnit[0],
          // ),

          
        ]),
      ),
    );
  }
}