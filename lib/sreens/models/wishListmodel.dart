class WishListModel {
  final String WishListName;
  final String WishListImage;
  final int WishListPrice;
  final String WishListId;
  int WishListquantity;
  var WishListUnit;
  WishListModel(
      {required WishListUnit,
        required this.WishListId,
        required this.WishListName,
      required this.WishListImage,
      required this.WishListPrice,
      required this.WishListquantity });
}