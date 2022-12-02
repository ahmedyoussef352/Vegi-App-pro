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
  final bool? unit;
  final bool? admin;
  Function? onDelete;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  SingleProduct(
      {this.productQuantity,
      required this.productUnit,
      required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      this.unit,
      this.admin,
      this.onDelete});

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

    // widget.productUnit.productUnit.firstWhere((element) {
    //   setState(() {
    //     firstValue = element;
    //   });
    //   return true;
    // });
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
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w700),
                            ),
                            widget.unit == true
                                ? Text(
                                    "${widget.productPrice}\$/500 Gram",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  )
                                : Text(
                                    "${widget.productPrice}\$/Piece",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                            SizedBox(
                              height: 1,
                            ),
                            Expanded(
                              child: widget.admin == false
                                  ? Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          // ignore: sized_box_for_whitespace
                                          child: widget.unit == true
                                              ? Container(
                                                  width: 120,
                                                  height: 30,
                                                  child: ProductUnit(
                                                    onTap: () {},
                                                    title:
                                                        '500 Gram',
                                                  ),
                                                )
                                              : Container(
                                                  width: 120,
                                                  height: 30,
                                                  child: ProductUnit(
                                                    onTap: () {},
                                                    title: 'Piece',
                                                  ),
                                                ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Expanded(
                                          child: Count(
                                            productId: widget.productId,
                                            productImage: widget.productImage,
                                            productName: widget.productName,
                                            productPrice: widget.productPrice,
                                            productUnit: UnitData ?? firstValue,
                                            // productQuantity: data.first.cartQuantity,
                                          ),
                                        ),
                                      ],
                                    )
                                  : InkWell(
                                    onDoubleTap: () {
                                      setState(widget.onDelete!());  
                                    },
                                    child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 5,),
                                         margin: EdgeInsets.symmetric(
                                          horizontal: 5,
                                         ),
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: TextButton(
                                            // splashColor: Colors.black,
                                            // color: Colors.orange,
                                            onPressed: () {},
                                            child: Expanded(
                                              child: Text(
                                                'Delete',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )),
                                      ),
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
