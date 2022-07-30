import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../sreens/models/productmodel.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;
  List<ProductModel> search = [];

  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productUnit: element.get("productUnit"),
      productId: element.get("productId"),
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productQuantity: element.get("productQuantity")
       );
        
    search.add(productModel);
  }

  ///////////////////HerbsProduct
  List<ProductModel> herbsProductList = [];

  fatchHerbsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();

    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }

  /////////////////FreshProduct
  ///
  ///
  ///
  ///
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

////////////////////RootProduct
  ///
  List<ProductModel> rootProductList = [];

  fatchRootProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Rootproduct").get();

    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    rootProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getRootProductDataList {
    return rootProductList;
  }

  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
