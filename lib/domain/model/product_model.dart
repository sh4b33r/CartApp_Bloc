class ProductModel {
  String title;
  String price;
  String image;
  bool fav;

  ProductModel({required this.title, required this.price, required this.image,required this.fav});

  static ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel(
        title: map["title"], price: map["price"].toString(), image: map["image"],fav:false);
  }
}
