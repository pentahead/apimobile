class ProductData {
  final String? color;
  final String? capacity;
  final double? price;
  final String? generation;
  final int? year;
  final String? cpuModel;
  final String? hardDiskSize;
  final String? strapColour;
  final String? caseSize;
  final String? description;
  final String? screenSize;

  ProductData({
    this.color,
    this.capacity,
    this.price,
    this.generation,
    this.year,
    this.cpuModel,
    this.hardDiskSize,
    this.strapColour,
    this.caseSize,
    this.description,
    this.screenSize,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      color: json['color'] ?? json['Color'] ?? json['Strap Colour'],
      capacity: json['capacity'] ?? json['Capacity'],
      price: json['price'] != null ? json['price'].toDouble() : json['Price'] != null ? double.tryParse(json['Price']) : null,
      generation: json['generation'] ?? json['Generation'],
      year: json['year'],
      cpuModel: json['CPU model'],
      hardDiskSize: json['Hard disk size'],
      strapColour: json['Strap Colour'],
      caseSize: json['Case Size'],
      description: json['Description'],
      screenSize: json['Screen size'] != null ? json['Screen size'].toString() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'capacity': capacity,
      'price': price,
      'generation': generation,
      'year': year,
      'CPU model': cpuModel,
      'Hard disk size': hardDiskSize,
      'Strap Colour': strapColour,
      'Case Size': caseSize,
      'Description': description,
      'Screen size': screenSize,
    };
  }
}

class Product {
  final String id;
  final String name;
  final ProductData? data;

  Product({
    required this.id,
    required this.name,
    this.data,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      data: json['data'] != null ? ProductData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'data': data?.toJson(),
    };
  }
}
