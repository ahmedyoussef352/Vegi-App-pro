import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuyuyuy/sreens/admin/admin_panel/admin_home.dart';
import '../sreens/Widget/app_scaffold.dart';
import '../sreens/models/productmodel.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;
  List<ProductModel> search = [];

  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
        // productUnit: element.get("productUnit"),
        productId: element.get("productId"),
        productImage: element.get("productImage"),
        productName: element.get("productName"),
        productPrice: element.get("productPrice"),
        productQuantity: element.get("productQuantity"));

    search.add(productModel);
  }

  /////////////////FreshProduct
  List<ProductModel> freshProductList = [];

  fatchFreshProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Freshproduct").get();

    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      productModels(element);

      newList.add(productModel);
    });
    freshProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFreshProductDataList {
    return freshProductList;
  }

  ///////////////////FashionProduct
  List<ProductModel> fashionProductList = [];

  fashionProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Fashionproduct").get();

    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    fashionProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getfashionProductDataList {
    return fashionProductList;
  }

  ////////////// PhonesProduct
  List<ProductModel> phonesProductList = [];

  fatchPhonesProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Phonesproduct").get();

    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      productModels(element);

      newList.add(productModel);
    });
    phonesProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getPhonesProductDataList {
    return phonesProductList;
  }

/////////////tabletsProduct
  List<ProductModel> tabletsProductList = [];

  fatchTabletsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Tabletsproduct").get();

    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      productModels(element);

      newList.add(productModel);
    });
    tabletsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getTabletsProductDataList {
    return tabletsProductList;
  }

  /////////////CosmeticsProduct
  List<ProductModel> cosmeticsProductList = [];

  fatchCosmeticsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Cosmeticsproduct").get();

    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      productModels(element);

      newList.add(productModel);
    });
    cosmeticsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getCosmeticsProductDataList {
    return cosmeticsProductList;
  }

  List<ProductModel> get getAllProductSearch {
    return search;
  }

  superMarketDataDelete(productId) {
    FirebaseFirestore.instance
        .collection("Freshproduct")
        .doc(productId)
        .delete();
        notifyListeners();
  }
  fashionDataDelete(productId) {
    FirebaseFirestore.instance
        .collection("Fashionproduct")
        .doc(productId)
        .delete();
        notifyListeners();
  }
  phonesDataDelete(productId) {
    FirebaseFirestore.instance
        .collection("Phonesproduct")
        .doc(productId)
        .delete();
        notifyListeners();
  }
  tabletsDataDelete(productId) {
    FirebaseFirestore.instance
        .collection("Tabletsproduct")
        .doc(productId)
        .delete();
        notifyListeners();
  }
  cosmeticsDataDelete(productId) {
    FirebaseFirestore.instance
        .collection("Cosmeticsproduct")
        .doc(productId)
        .delete();
        notifyListeners();
  }

////////add product of admin
bool isloadding = false;
TextEditingController productIde = TextEditingController();
TextEditingController productName = TextEditingController();
TextEditingController productImage = TextEditingController();
TextEditingController productPrice = TextEditingController();
TextEditingController productQuantity =  TextEditingController();
// List<dynamic> productUnit  = TextEditingController() as List ;
  void addProduct(context,String collextion,productId) async {
    if (productIde.text.isEmpty) {
      Fluttertoast.showToast(msg: "Product Id is empty");
    } else if (productName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Product Name is empty");
    } else if (productImage.text.isEmpty) {
      Fluttertoast.showToast(msg: "Product Image is empty");
    } else if (productPrice.text.isEmpty) {
      Fluttertoast.showToast(msg: "Product Price is empty");
    } else if (productQuantity.text.isEmpty) {
      Fluttertoast.showToast(msg: "Product Quantity is empty");
    } 
    // else if (productUnit.isEmpty) {
    //   Fluttertoast.showToast(msg: "street is empty");
    // } 
    else {
      isloadding = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection(collextion)
          .doc()
          .set({
         "productId":productIde.text,
        "productImage": productImage.text,
        "productName": productName.text,
        "productPrice": productPrice.hashCode,
        "productQuantity": productQuantity.hashCode,
        
      }).then((value) async {
        isloadding = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "Add your product");
        Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return AppScaffold(child: AdminPanelHome());
                  }));
        notifyListeners();
      });
      notifyListeners();
    }
  }

}
