import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/wish_List_provider.dart';
import '../Widget/singleitem.dart';
import '../models/productmodel.dart';
import '../models/wishListmodel.dart';

class WishList extends StatefulWidget {
  //  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
 late WishListProvider wishListProvider ;
  

  showAlertDialog(BuildContext context, ProductModel delete) {
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
        wishListProvider.deleteWishtList(delete.productId);

        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Wish List"),
      content: Text("Are you sure for delete the Product"),
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
    wishListProvider = Provider.of(context);
    wishListProvider.getWishtListData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        // centerTitle: true,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
      color: Colors.black,),

        elevation: 0,
        backgroundColor: Color.fromARGB(255, 237, 204, 71),
        title: Text(
          'WishList',
          style: TextStyle(
            color: Colors.black
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
        ),
        child:wishListProvider.getWishList.isEmpty?
        Center(
          child: Text("No Data"),
        ) 
        : ListView.builder(
          itemCount: wishListProvider.getWishList.length,
          itemBuilder: (context, index) {
            ProductModel data = wishListProvider.getWishList[index];
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SingleItem(
                  isBool: true,
                  productImage: data.productImage,
                  productName: data.productName,
                  productPrice: data.productPrice,
                  productId: data.productId,
                  productQuantity: data.productQuantity,
                  productUnit: data.productUnit,

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
