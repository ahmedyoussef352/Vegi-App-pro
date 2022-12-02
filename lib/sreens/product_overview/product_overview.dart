import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/wish_List_provider.dart';
import '../Widget/app_scaffold.dart';
import '../Widget/count.dart';
import '../reviewcart/reviewcart.dart';

class ProductOverview extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final String productId;
  // var ProductUnit;
  // ignore: non_constant_identifier_names
  final int? ProductQuatity;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  ProductOverview(
      {
        // required this.ProductUnit,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productId,
      // ignore: non_constant_identifier_names
      this.ProductQuatity});

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

enum SinginCharacter { fill, outline }

class _ProductOverviewState extends State<ProductOverview> {
  var _character = SinginCharacter.fill;
  Widget bonntonNavigator({
    required Color iconColor,
    required String title,
    required IconData iconData,
    required Color backgroundColor,
    required Color color,
    required Function onTap,
  }) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(onTap());
      },
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: color,
              ),
            )
          ],
        ),
      ),
    ));
  }

  late WishListProvider wishListProvider;
  // ignore: non_constant_identifier_names
  bool WishListBool = false;
  getWishListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        WishListBool = value.get("WishList");
                      }),
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    getWishListBool();
    wishListProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 237, 204, 71),
        title: Text(
          'Product Overview',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(),
      ),
      bottomNavigationBar: Row(
        children: [
          bonntonNavigator(
            onTap: () {
              setState(() {
                WishListBool = !WishListBool;
              });
              if (WishListBool == true) {
                wishListProvider.addWishListData(
                  // wishListUnit: widget.ProductUnit,
                  wishListId: widget.productId,
                  wishListImage: widget.productImage,
                  wishListName: widget.productName,
                  wishListPrice: widget.productPrice,
                  wishListQuantity: 2,
                );
              } else {
                wishListProvider.deleteWishtList(widget.productId);
              }
            },
            backgroundColor: Colors.black,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: 'Add To WishList',
            iconData:
                WishListBool == false ? Icons.favorite_outline : Icons.favorite,
          ),
          bonntonNavigator(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AppScaffold(child: ReviewCart()),
                  ));
                });
              },
              backgroundColor: Color.fromARGB(255, 237, 204, 71),
              color: Colors.black,
              iconColor: Colors.white,
              title: 'Go To Cart',
              iconData: Icons.shop_outlined),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$ ${widget.productPrice}',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      width: 350,
                      height: 250,
                      child: Image.network(widget.productImage),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Available Options',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.green[700],
                        ),
                        Radio(
                          value: SinginCharacter.fill,
                          groupValue: _character,
                          activeColor: Colors.green[700],
                          onChanged: (SinginCharacter? value) {
                            setState(() {
                              _character = value!;
                            });
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '\$${widget.productPrice}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 200),
                        Count(
                          productUnit: '500 Gram',
                          //  productQuantity: widget.productQuantity,
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                          // productQuantity: widget.productQuantity
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'About this Product',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      '''in marketing, a product is an object or system made available for consumer use, it  is anything that can be offered to a mrket to   satisfy the desire or need of a customer .
Wikipedia''',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
