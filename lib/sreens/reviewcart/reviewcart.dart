import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../providers/reviewcart_providers.dart';
import '../Widget/app_scaffold.dart';
import '../Widget/singleitem.dart';
import '../check_out/delivery_details/delivery_details.dart';
import '../models/reviewcartmodel.dart';

// ignore: use_key_in_widget_constructors
class ReviewCart extends StatefulWidget {
  //  List<ProductModel> search;
  //  const ReviewCart({Key? key}) : super(key: key);

  @override
  //////////////delete

  State<ReviewCart> createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  late ReviewCartProvider reviewCartProvider;
  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(delete.cartId);

        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Are you delete cartproduct"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text('Total Aount'),
        subtitle: Text(
          '\$ ${reviewCartProvider.getTotalPrice()}',
          style: TextStyle(color: Colors.green[800]),
        ),
        // ignore: sized_box_for_whitespace
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text(
              'Subtmit',
              style: TextStyle(),
            ),
            color: Color.fromARGB(255, 237, 204, 71),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              if (reviewCartProvider.getReviewCartDataList.isEmpty) {
                Fluttertoast.showToast(msg: 'No Cart found');
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) =>
                        AppScaffold(child: DeliveryDetails()))));
              }
            },
          ),
        ),
      ),
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
          'ReviewCart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
        ),
        child: reviewCartProvider.getReviewCartDataList.isEmpty
            ? Center(
                child: Text("No Data"),
              )
            : ListView.builder(
                itemCount: reviewCartProvider.getReviewCartDataList.length,
                itemBuilder: (context, index) {
                  ReviewCartModel data =
                      reviewCartProvider.getReviewCartDataList[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SingleItem(
                        isBool: true,
                        wishList: false,
                        productImage: data.cartImage,
                        productName: data.cartName,
                        productPrice: data.cartPrice,
                        productQuantity: data.cartQuantity,
                        productId: data.cartId,
                        productUnit: data.cartUnit,
                        onDelete: () {
                          showAlertDialog(context, data);
                        },
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
