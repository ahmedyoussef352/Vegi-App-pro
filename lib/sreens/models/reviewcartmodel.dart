// ignore_for_file: prefer_typing_uninitialized_variables

class ReviewCartModel {
  final String cartName;
  final String cartImage;
  final int cartPrice;
  final String cartId;
  int cartQuantity;
  var cartUnit;
  ReviewCartModel(
      {required this.cartUnit,
        required this.cartId,
        required this.cartName,
      required this.cartImage,
      required this.cartPrice,
      required this.cartQuantity });
}