import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apimobile/models/Mproduct.dart';

class ProductController {
  final String apiUrl = 'https://api.restful-api.dev/objects';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {    
      throw Exception('Failed to load products');
    }
  }
}
