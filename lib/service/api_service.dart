import 'dart:convert';
import 'package:http/http.dart' as http;

import '../main.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('제품 목록을 가져오는데 실패했습니다.');
    }
  }

  static Future<Product> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 201) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('제품을 추가하는데 실패했습니다.');
    }
  }

  // static Future<Product> deletProduct(Product product) async {
  //   final responst = await http.delete(
  //     Uri.parse('$baseUrl/prducts'),
  //   );

  //   if (responst.statusCode == 200) {
  //     return
  //   }
  // }
}
