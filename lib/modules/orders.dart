import 'package:get/get.dart';

class OrderProducts {
  final int generalId;
  final int productId;
  final String name;
  final String image;
  final double price;
  final int evaluation;
  final double discount;
  RxDouble quantity;
  final String category;
  final String subCategory;

  OrderProducts({
    required this.generalId,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required double quantity,
    required this.evaluation,
    required this.discount,
    required this.category,
    required this.subCategory,
  }) : quantity = quantity.obs;

  factory OrderProducts.fromJson(Map<String, dynamic> json) {
    final product = json['peoduct'];
    final subCategory = product?['sub-category'];
    final category = subCategory?['category'];

    return OrderProducts(
      generalId: json['id'] ?? 0,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0.0,
      productId: product?['id'] ?? 0,
      name: product?['name'] ?? 'Unknown',
      image: product?['image'] ?? '',
      price: (product?['price'] as num?)?.toDouble() ?? 0.0,
      evaluation: product?['evaluation'] ?? 0,
      discount: (product?['discount'] as num?)?.toDouble() ?? 0.0,
      category: category?['name'] ?? 'Unknown',
      subCategory: subCategory?['name'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': generalId,
      'quantity': quantity.value,
      'product': {
        'id': productId,
        'name': name,
        'image': image,
        'price': price,
        'evaluation': evaluation,
        'discount': discount,
        'sub-category': {
          'name': subCategory,
          'category': {'name': category},
        },
      },
    };
  }
}
