// ignore: file_names
// ignore_for_file: prefer_typing_uninitialized_variables, file_names, duplicate_ignore
import 'package:flutter/material.dart';
import '../Widget/count.dart';
import '../Widget/productUnit.dart';
import '../models/productmodel.dart';


class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final String productId;
  final ProductModel productUnit;
  final int? productQuantity;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  SingleProduct(
      {this.productQuantity,
      required this.productUnit,
      required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}
class _SingleProductState extends State<SingleProduct> { 
  // ignore: non_constant_identifier_names
  var UnitData;
  var firstValue;
  @override
  @override
  Widget build(BuildContext context) {
      //   reviewCartProvider = Provider.of<ReviewCartModel>(context) as ReviewCartProvider;
      //  List data = reviewCartProvider.reviewCartDataList;

    widget.productUnit.productUnit.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
                height: 230,
                width: 160,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Image.network(
                                widget.productImage.toString(),
                              ),
                            )),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.productName.toString(),
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${widget.productPrice}\$/${UnitData ?? firstValue}",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    // ignore: sized_box_for_whitespace
                                    child: Container(
                                      width: 120,
                                      height: 30,
                                      child: ProductUnit(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: widget
                                                      .productUnit.productUnit
                                                      .map<Widget>((data) {
                                                    return Column(
                                                      children: [
                                                        InkWell(
                                                          
                                                          onTap: () async {
                                                            setState(() {
                                                              UnitData = data;
                                                            });
                                                            Navigator.of(context)
                                                                .pop();
                                                          },
                                                          // ignore: sized_box_for_whitespace
                                                          child: Container(
                                                            width: double.infinity,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                SizedBox(height: 5),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          top: 20,
                                                                          bottom:
                                                                              15,
                                                                          left: 10),
                                                                  child: Text(
                                                                    data,
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color
                                                                          .fromARGB(
                                                                              255,
                                                                              245,
                                                                              206,
                                                                              50),
                                                                      fontSize: 18,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  }).toList(),
                                                );
                                              });
                                        },
                                        title: UnitData ?? firstValue,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                   Count(
                                    productId: widget.productId,
                                    productImage: widget.productImage,
                                    productName: widget.productName,
                                    productPrice: widget.productPrice,
                                    productUnit: UnitData ?? firstValue,
                                          // productQuantity: data.first.cartQuantity,
                                  ),
        
                                ],
                              ),
                            ),
                          ],
                        )),
                      ]),
                )),
          ),
        ],
      ),
    );
  }
}