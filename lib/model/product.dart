class Product {
  late int id;
  late String title;
  late double price;
  late String description;
  late String category;
  late String image;
  Rating? rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] is int) ? json['price'].toDouble() : json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null
          ? Rating.fromJson(json['rating'])
          : null,
    );
  }
}

class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] is int) ? json['rate'].toDouble() : json['rate'],
      count: json['count'],
    );
  }
}
