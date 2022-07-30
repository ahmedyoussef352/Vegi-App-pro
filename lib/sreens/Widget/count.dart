// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors, must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/reviewcart_providers.dart';

class Count extends StatefulWidget {
  // const Count({Key? key}) : super(key: key);
  String productName;
  String productImage;
  String productId;
 //int? productQuantity;
  int productPrice;
   var productUnit;
  Count({
     this.productUnit,
    required this.productName,
    required this.productImage,
    required this.productId,
     //this.productQuantity,
    required this.productPrice,
  });

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  late ReviewCartProvider reviewCartProvider;
   int count = 1;
  // count = widget.productQuantity;
  bool isTrue = false;
  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        count=value.get("cartQuantity");
                        isTrue = value.get("isAdd");
                        // count = widget.productQuantity!;
                      })
                    }
                }
                // else if (this.mounted)
                // {
                //   if (value.exists)
                //     {
                //       setState(() {
                //         count=value.get("cartQuantity");
                //         isTrue = value.get("isAdd");
                //       })
                //     }
                // }
            });
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    reviewCartProvider = Provider.of(context);
    return Expanded(
        child: Container(
            padding: const EdgeInsets.only(left: 1),
            height: 30,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(8),
            ),
            child: isTrue == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          
                          if (count == 1) {
                            setState(() {
                              isTrue = false;
                            });
                            reviewCartProvider.reviewCartDataDelete(widget.productId);
                            //count = 0;
                          
                          }
                          else if (count > 1) {
                            setState(() {
                              count--;
                            });
                            reviewCartProvider.updateReviewCartData(
                              cartUnit: widget.productUnit,
                             
                            cartId: widget.productId,
                            cartImage:widget.productImage,
                            cartName:  widget.productName ,
                            cartPrice: widget.productPrice,
                            cartQuantity: count,
                          );
                          }
                          
                        },
                        child: Icon(
                          Icons.remove,
                          size: 15,
                          color: Color.fromARGB(255, 237, 204, 71),
                        ),
                      ),
                      Text(
                        '$count',
                        style: TextStyle(
                          color: Color.fromARGB(255, 237, 204, 71),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            count++;
                          });
                          reviewCartProvider.updateReviewCartData(  
                          cartUnit: widget.productUnit,
                            cartId: widget.productId,
                            cartImage:widget.productImage,
                            cartName:  widget.productName ,
                            cartPrice: widget.productPrice,
                            cartQuantity: count,
                            
                          );
                        },
                        child: Icon(
                          Icons.add,
                          size: 15,
                          color: Color.fromARGB(255, 237, 204, 71),
                        ),
                      )
                    ],
                  )
                : Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isTrue = true;
                        });
                        reviewCartProvider.addReviewCartData(
                          cartUnit: widget.productUnit,
                            cartId: widget.productId,
                            cartName: widget.productName,
                            cartImage: widget.productImage,
                            cartPrice: widget.productPrice,
                            cartquantity: count);
                      },
                      child: Text(
                        "ADD",
                        style: TextStyle(
                          color: Color.fromARGB(255, 237, 204, 71),
                        ),
                      ),
                    ),
                  )));
  }
}
