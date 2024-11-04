class Products {
  final int id;
  final String name;
  final String image;
  final double price;
  final int evaluation;
  final double discount;
  final String category;
  final String subCategory;

  Products({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.evaluation,
    required this.discount,
    required this.category,
    required this.subCategory,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      evaluation: json['evaluation'],
      discount: (json['discount'] as num).toDouble(),
      category: json['sub-category']['category']['name'],
      subCategory: json['sub-category']['name'],
    );
  }
}
