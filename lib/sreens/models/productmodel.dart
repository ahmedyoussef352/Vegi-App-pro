class ProductModel {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
   int productQuantity;
   List<dynamic>?productUnit;
  ProductModel(
      {
        // required this.productUnit,
        required this.productQuantity,
        required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice,
       });
}
