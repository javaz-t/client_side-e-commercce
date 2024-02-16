

class Product {
  final String id;
  final String brand;
  final String category;
  final String description;
  final String imageUrl;
  final String name;
  final bool offer;
  final double price;

  Product({
    required this.id,
    required this.brand,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.offer,
    required this.price,
  });

  // Convert a Product to JSON
  Map<String, dynamic> toJson() => {
    'id':id,
    'brand': brand,
    'category': category,
    'description': description,
    'imageUrl': imageUrl,
    'name': name,
    'offer': offer,
    'price': price,
  };

  // Create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    brand: json['brand'],
    category: json['category'],
    description: json['description'],
    imageUrl: json['imageUrl'],
    name: json['name'],
    offer: json['offer'],
    price: json['price'],
  );
}
