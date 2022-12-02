// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../providers/reviewcart_providers.dart';
import 'count.dart';

class SingleItem extends StatefulWidget {
  bool? isBool = false;
  String productImage;
  String productName;
  int productPrice;
  int? productQuantity;
  String? productId;
  Function? onDelete;
  bool? wishList = false;
  var productUnit;
  bool?search;

  SingleItem(
      {required this.productUnit,
      this.wishList,
      this.onDelete,
      this.productId,
      this.productQuantity,
      this.isBool,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      this.search});

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late int count;
  getCount() {
    setState(() {
      count = widget.productQuantity!;
    });
  }

  late ReviewCartProvider reviewCartProvider;
  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: 120,
                    height: 120,
                    child: Image.network(
                      widget.productImage,
                      width: 120,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 120,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.search==true? Text(
                        widget.productName,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ):
                      widget.search==true?Text(
                        widget.productName,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ):Text(
                        widget.productName,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      widget.search==true?
                      Text(
                        '${widget.productPrice}\$',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ):Text(
                        '${widget.productPrice}\$',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      widget.isBool == false
                          ? GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          ListTile(
                                            title: Text('50 Gram'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            title: Text('500 Gram'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                              title: Text('1 kg'),
                                              onTap: () {
                                                Navigator.pop(context);
                                              })
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "50 Gram",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: Colors.yellow,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : 
                          Text('${widget.productQuantity.toString()}x Quantity ',style: TextStyle(
                            color: Color.fromARGB(255, 234, 30, 15),
                            fontSize: 15,
                            fontWeight: FontWeight.w600
                          ),),
                    ],
                  ),
                ),
                widget.search==true ?Expanded(child: Container(
                  height: 100,
                  width: 100,
                ))

                :Expanded(
                  child: Container(
                    height: 90,
                    padding: widget.isBool == false
                        ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                        : EdgeInsets.only(left: 15, right: 15),
                    child: widget.isBool == false
                        ? Count(
                            // productQuantity: widget.productQuantity,
                            productUnit: widget.productUnit,
                            productId: widget.productId!,
                            productImage: widget.productImage,
                            productName: widget.productName,
                            productPrice: widget.productPrice,
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                widget.search==true?Container()

                                :InkWell(
                                  onTap: () {
                                    setState(widget.onDelete!());
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    size: 25,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                widget.wishList == false
                                    ? Container(
                                        height: 25,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (count == 1) {
                                                    Fluttertoast.showToast(
                                                      msg:
                                                          "You reach minimum limit",
                                                    );
                                                  } else {
                                                    setState(() {
                                                      count--;
                                                    });
                                                    reviewCartProvider
                                                        .updateReviewCartData(
                                                      cartUnit:
                                                          widget.productUnit,
                                                      cartImage:
                                                          widget.productImage,
                                                      cartId: widget.productId,
                                                      cartName:
                                                          widget.productName,
                                                      cartPrice:
                                                          widget.productPrice,
                                                      cartQuantity: count,
                                                    );
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Color.fromARGB(
                                                      255, 237, 204, 71),
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                "$count",
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 237, 204, 71),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (count < 10) {
                                                    setState(() {
                                                      count++;
                                                    });
                                                    reviewCartProvider
                                                        .updateReviewCartData(
                                                      cartUnit:
                                                          widget.productUnit,
                                                      cartImage:
                                                          widget.productImage,
                                                      cartId: widget.productId,
                                                      cartName:
                                                          widget.productName,
                                                      cartPrice:
                                                          widget.productPrice,
                                                      cartQuantity: count,
                                                    );
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: Color.fromARGB(
                                                      255, 237, 204, 71),
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(
                                        //

                                        ),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          widget.isBool == false
              ? Container()
              : Divider(
                  height: 1,
                  color: Colors.grey,
                ),
        ],
      ),
    );
  }
}
