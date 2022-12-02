
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../sreens/models/productmodel.dart';

class WishListProvider with ChangeNotifier {
  addWishListData({
    required String wishListId,
    required String wishListName,
    required int wishListPrice,
    required String wishListImage,
    required int wishListQuantity,
      List<dynamic>? wishListUnit,
  }) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set({
      "wishListUnit" : wishListUnit,
      "wishListId": wishListId,
      "wishListName": wishListName,
      "wishListImage": wishListImage,
      "wishListPrice": wishListPrice,
      "wishListQuantity": wishListQuantity,
      "wishList":true,
      // "wishList": true,
    });
  }

  // void updateReviewCartData({
  //    required String wishListId,
  //   required String wishListName,
  //   required int wishListPrice,
  //   required String wishListImage,
  //   required int wishListQuantity,
  //    required var WishListUnit,
  // }) async {
  //   FirebaseFirestore.instance
  //       .collection("WishList")
  //       .doc(FirebaseAuth.instance.currentUser?.uid)
  //       .collection("YourWishList")
  //       .doc(wishListId)
  //       .update({
  //         // "cartUnit":cartUnit,
  //     "WishListUnit" : WishListUnit,
  //     "wishListId": wishListId,
  //     "wishListName": wishListName,
  //     "wishListImage": wishListImage,
  //     "wishListPrice": wishListPrice,
  //     "wishListQuantity": wishListQuantity,
  //     "isAdd":true,
  //     // "isAdd": true,
  //   });
  // }


///// Get WishList Data ///////
  List<ProductModel> wishList = [];

  getWishtListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach(
      (element) {
        ProductModel productModel = ProductModel(
          productId: element.get("wishListId"),
          productImage: element.get("wishListImage"),
          productName: element.get("wishListName"),
          productPrice: element.get("wishListPrice"),
          productQuantity: element.get("wishListQuantity"),
          // productUnit: element.get("wishListUnit")
        );
        newList.add(productModel);
      },
    );
    wishList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList {
    return wishList;
  }





////////// Delete WishList /////
deleteWishtList(wishListId){
 FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .delete();
        notifyListeners();
}






}
