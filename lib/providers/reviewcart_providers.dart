import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../sreens/models/reviewcartmodel.dart';


class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartquantity,
    required var cartUnit,
    
    // required var cartUnit
  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .set({
      "cartName": cartName,
      "cartPrice": cartPrice,
      "cartImage": cartImage,
      "cartId": cartId,
      "cartQuantity": cartquantity,
      "isAdd":true,
       "cartUnit": cartUnit,
      // "isAdd": true,
    });
  }
  //////////////update

void updateReviewCartData({
     String? cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
     required var cartUnit
  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .update({
          // "cartUnit":cartUnit,
      "cartName": cartName,
      "cartPrice": cartPrice,
      "cartImage": cartImage,
      "cartId": cartId,
      "cartQuantity": cartQuantity,
      "isAdd":true,
       "cartUnit": cartUnit,
      // "isAdd": true,
    });
  }

  List<ReviewCartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];

    // ignore: non_constant_identifier_names
    QuerySnapshot ReviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .get();
    // ignore: avoid_function_literals_in_foreach_calls
    ReviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartUnit: element.get("cartUnit"),
          cartImage: element.get("cartImage"),
          cartName: element.get("cartName"),
          cartPrice: element.get("cartPrice"),
          cartQuantity: element.get("cartQuantity"),
          cartId: element.get("cartId"));
      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }


  ////// get Total price
  getTotalPrice(){
    double total = 0.0;
    // ignore: avoid_function_literals_in_foreach_calls
    reviewCartDataList.forEach((element) {
      total += element.cartPrice * element.cartQuantity;
    }); 
    return total;
  }

  //////////////////Delete
  reviewCartDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
        notifyListeners();
  }
}
