class ProductModel {
  final dynamic id;
  final String title, description, image, category;
  final dynamic price;
  final RatingModel? rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.category,
      required this.rating});

  factory ProductModel.fromjson(jsondata) {
    return ProductModel(
        id: jsondata['id'],
        title: jsondata['title'],
        description: jsondata['description'],
        image: jsondata['image'],
        price: jsondata['price'],
        category: jsondata['category'],
        rating: jsondata['rating'] == null
            ? null
            : RatingModel.fromjson(jsondata['rating']));
  }
}

class RatingModel {
  final num rate;
  final num count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromjson(jsondata) {
    return RatingModel(rate: jsondata['rate'], count: jsondata['count']);
  }
}
